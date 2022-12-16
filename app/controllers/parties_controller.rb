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
  end

  def create
  end
end
