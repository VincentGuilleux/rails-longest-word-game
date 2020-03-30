require 'open-uri'

class GamesController < ApplicationController
  def new
    @random_word = Array.new(10) { Array('A'..'Z').sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    english_word_dict = open(url).read
    english_word_check = JSON.parse(english_word_dict)
    word_array = params[:word].upcase.chars
    word_in_grid = word_array.all? { |e| params[:random_word].include?(e) }
    if english_word_check['found']
      # the key found returns a boolean if included in English in Wagon dic app
      @result = 'outside the grid' unless word_in_grid
    else @result = 'not an english word'
    end
  end
end
