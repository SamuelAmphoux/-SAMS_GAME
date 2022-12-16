class GamesController < ApplicationController
  def new
    @new_game = Game.new(user: current_user)
    if @new_game.save
      redirect_to new_game_party_path(@new_game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end
end
