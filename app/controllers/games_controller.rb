require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { Array('A'..'Z').sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    english_word_dict = open(url).read
    english_word_check = JSON.parse(english_word_dict)
    @letters
    word_array = params[:word].upcase.chars
    # check = word_array.all? { |e| @letters.include?(e) }
    raise
    if english_word_check['found']
      # the key found returns a boolean if included in English in Wagon dic app
      @result = 'ok english word'

    else @result = 'not an english word'
    end
  end
end
