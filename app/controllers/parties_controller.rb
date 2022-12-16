class PartiesController < ApplicationController
  def new
    # Generate a 10 letters array (5 * vowels - 5 * consonants)
    @letters = []
    5.times do
      @letters << ['a', 'e', 'i', 'o', 'u', 'y'][rand(6)]
    end
    5.times do
      @letters << ('a'..'z').to_a.reject { |letter| ['a', 'e', 'i', 'o', 'u', 'y'].include?(letter) }[rand(20)]
    end
    @letters.shuffle
    @party = Party.new
  end

  def create
    # Write method to save party and redirect to party's results
    @party = Party.new(party_params)
    # Implement later code to test if word is actually available
    @party.available = available?(@party)
    # Implement later code to calculte score
    @party.score = @party.word.chars.count
    @party.game = Game.find(params[:game_id])
    if @party.save!
      redirect_to game_path(@party.game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def party_params
    params.require(:party).permit(:word, :ten_letters_list, :game_id)
  end

  def available?(party)
    party.word.chars.all? { |letter| party.word.count(letter) <= party.ten_letters_list.count(letter) }
    # V2 : Test if word is real with api call
  end
end
