require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { Array('A'..'Z').sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    english_word_dict = open(url).read
    english_word_check = JSON.parse(english_word_dict)
    if english_word_check["found"]
      @result = "ok english word"
    else @result = "not an english word"
    end
  end
end
