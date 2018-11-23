class GamesController < ApplicationController
  # Deleting this line causes the InvalidAuthenticityToken error. 
  skip_before_action :verify_authenticity_token

  def create
    p "This creates games"
    new_game = Game.create(name: game_params[:name])
    display = new_game.errors.messages.presence ? new_game.errors : new_game
    render json: display
  end

  def delete
    p "This deletes games"
    game_to_delete = Game.all.find_by(name: game_params[:name])
    game_to_delete.destroy
    display = game_to_delete.errors.messages.presence ? game_to_delete.errors : game_to_delete
    render json: display
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
