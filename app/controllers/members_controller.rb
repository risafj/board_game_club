class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    new_member = Member.create(
      name: member_params[:name],
      favorite_game: Game.find_by(name: member_params[:game]),
      # How does this work when what you're passing is an array?
      available_days: 
      friends: 
      )
  end

  def delete
  end

  def add_friend
  end

  def delete_friend
  end

  def member_params
    params.require(:member).permit(:name, :favorite_game, :available_days, :friends)
  end
end
