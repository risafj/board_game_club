class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # Not sure if the below is going to work for the items that have to be arrays (days, friends).
  # Also, the foreign key items (everything but name) has to be find_by ...
  def create
    new_member = Member.create(
      name: member_params[:name],
      favorite_game: member_params[:favorite_game],
      available_days: member_params[:available_days],
      friends: member_params[:friends]
      )
    display = new_member.errors.messages.presence ? new_members.errors : new_member
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
  new_friends = member_params[:friends]
  member.update(friends: new_friends)
  display = false
    render json: display
  
  end

  def delete_friend
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :favorite_game, :available_days, :friends)
  end

end
