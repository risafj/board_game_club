class GamesController < ApplicationController
  # Deleting this line causes the InvalidAuthenticityToken error.
  skip_before_action :verify_authenticity_token

  # Modeled on below.
  # https://medium.com/@stevenpetryk/providing-useful-error-responses-in-a-rails-api-24c004b31a2e
  def create
    new_game = Game.new(name: game_params[:name])
    if new_game.save
      render json: new_game
    else
      render json: new_game.errors.messages, status: :bad_request
    end
  end

  def delete
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
