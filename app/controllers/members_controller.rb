class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
 
  def create
    new_member = Member.create(
      name: member_params[:name],
      favorite_game: Game.find_by(name: member_params[:favorite_game]),
      available_days: member_params[:available_days].map { |day| Weekday.find_by(name: day) },
      friends: member_params[:friends].map { |friend| Member.find_by(name: friend) }
      )
    # display = new_member.errors.messages.presence ? new_member.errors : new_member

    display =
      if new_member.errors.messages.presence 
        new_member.errors
      else{
        name: new_member.name,
        favorite_game: new_member.favorite_game.name,
        available_days: new_member.available_days.pluck(:name),
        friends: new_member.friends.pluck(:name),
      }.to_json
      end

    render json: display
  end

  def delete
    member_to_delete = Member.all.find_by(name: member_params[:name])
    member_to_delete.destroy
    display = member_to_delete.errors.messages.presence ? member_to_delete.errors : member_to_delete
    render json: display
  end

  def add_friend
  member = member_params[:name]
  new_friends = member_params[:friends].each { |friend| Member.find_by(name: friend) }
  member.update(friends: new_friends)
  display = member.errors.messages.presence ? member.errors : new_member
    render json: display
  
  end

  def delete_friend
  end
  
  # Passing an array as strong params can be done by declaring an empty array, as below.
  # https://stackoverflow.com/questions/16549382/how-to-permit-an-array-with-strong-parameters
  private
  def member_params
    params.require(:member).permit(:name, :favorite_game, available_days: [], friends: [])
  end

end
