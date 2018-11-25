class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
 
  def create
    new_member = Member.create(
      name: member_params[:name],
      favorite_game: Game.find_by(name: member_params[:favorite_game]),
      available_days: member_params[:available_days].map { |day| Weekday.find_by(name: day) },
      friends: member_params[:friends].map { |friend| Member.find_by(name: friend) }
      )
      
    # If you want to customise the json to be rendered in the response, make your own hash and do to_json.
    display =
      if new_member.errors.messages.presence 
        new_member.errors
      else {
        name: new_member.name,
        favorite_game: new_member.favorite_game.name,
        available_days: new_member.available_days.pluck(:name),
        friends: new_member.friends.pluck(:name),
      }
      end

    # Declaring that you are rendering a json as below is essentially the same as going {hash: value}.to_json
    render json: display
  end

  def delete
    member_to_delete = Member.find_by(name: member_params[:name])
    member_to_delete.destroy
    
    display = member_to_delete.errors.messages.presence ? member_to_delete.errors : {name: member_to_delete.name}
    render json: display
  end

  def add_friend
    # member = Member.find_by(id: add_friends[:id])
    # The above would not throw an error if the ID isn't valid, it would just equate to nil.
    # The below would immediately throw an error.
    member = Member.find(params[:id])
    new_friends = Member.where(name: add_friend_params[:friends]).where.not(id: member.friends.pluck(:id))
    member.update(friends: current_friends << new_friends)
    display = member.errors.messages.presence ? member.errors : {message: "Friends added", friends: member.friends.pluck(:name)}
    render json: display
  end

  def delete_friend
    member =  Member.find_by(name: member_params[:name])
    friend_to_delete 
  end
  
  # Passing an array as strong params can be done by declaring an empty array, as below.
  # https://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters
  private
  def member_params
    params.require(:member).permit(:name, :favorite_game, available_days: [], friends: [])
  end
  
  def add_friend_params
    params.require(:member).permit(friends: [])
  end
end
