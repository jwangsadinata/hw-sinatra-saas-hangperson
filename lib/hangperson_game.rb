class HangpersonGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # Hi handsome duong, sorry that I started first.
  # most of the test cases have , :pending => true, before the do is being called.
  # if you need to go through all the pending result, 
  # you might wanna try to just put it before you test the code out
  
  # Wait I actually got all my code working so I am putting the pending test cases back
  # so you can play around with it.

  # def initialize()
  # end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end




  
  # Handsome Jason trying here
  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word.downcase
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess letter
    raise ArgumentError unless letter =~ /[A-Za-z]/
    letter = letter.downcase
    return false if @guesses.include? letter or @wrong_guesses.include? letter
    if @word.include? letter 
      @guesses << letter
    else
      @wrong_guesses << letter
    end
    return true
  end
  
  def word_with_guesses
    display = ''
    @word.chars do |letter|
      value = (@guesses.include? letter) ? letter : '-'
      display << value
    end
    return display
  end
  
  def check_win_or_lose
    winChars = 0
    @word.chars do |letter|
      winChars += 1 if @guesses.include? letter
    end
    return :win if (winChars == @word.length)
    return :lose if @wrong_guesses.length >= 7
    return :play
  end

  

end
