class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    # [].compact removes all nil values from an array and returns the modified array.
    # [].compact! doesn't work in the case below, because it returns nil if no changes were made.
    new_member = Member.create(
      name: member_params[:name],
      favorite_game: Game.find_by(name: member_params[:favorite_game]),
      available_days: member_params[:available_days].map { |day| Weekday.find_by(name: day) },
      friends: member_params[:friends].map { |friend| Member.find_by(name: friend) }.compact
      )
      
    # If you want to customise the json to be rendered in the response, make your own hash and declare as json.
    display =
      if new_member.errors.messages.presence 
        new_member.errors
      else {
        message: "Member created",
        name: new_member.name,
        favorite_game: new_member.favorite_game.name,
        available_days: new_member.available_days.pluck(:name),
        friends: new_member.friends.pluck(:name)
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

  def add_friends
    # find_by would not throw an error if the id isn't valid, it would just equate to nil (and then, later an error would occur when the code cannot be executed).
    # find would immediately throw an error if the id does not exist.
    # In the case below, we use plain "params" because the parameter is written in the url itself, like /1/.
    member = Member.find(params[:id])

    # .where returns an active record relation (array-like object).
    # https://stackoverflow.com/questions/9574659/rails-where-vs-find/9574674#9574674
    new_friends = Member.where(name: friends_relationship_params[:friends]).where.not(id: member.friends.pluck(:id))
    member.update(friends: member.friends << new_friends)
    display = member.errors.messages.presence ? member.errors : {message: "The following friends have been added - #{new_friends.pluck(:name)}"}
    render json: display
  end

  def delete_friends
    member = Member.find(params[:id])
    friends_to_delete = member.friends.where(name: friends_relationship_params[:friends])
    
    # When calling the .delete method, call it on the relation ("friends"), not the friend objects.
    # https://stackoverflow.com/questions/25660419/remove-object-from-has-many-but-dont-delete-the-original-record-in-rails
    member.friends.delete(friends_to_delete) unless friends_to_delete.nil?
    display = member.errors.messages.presence ? member.errors : {message: "The requested friends have been deleted"}
    render json: display
  end
  
  # Passing an array as strong params can be done by declaring an empty array, as below.
  # https://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters
  private
  def member_params
    params.require(:member).permit(:name, :favorite_game, available_days: [], friends: [])
  end
  
  def friends_relationship_params
    params.require(:member).permit(friends: [])
  end
end
