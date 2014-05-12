class Hangman
  MAX_WRONG_GUESSES = 8

  def initialize(setter, guesser)
    @setter, @guesser = setter, guesser
  end

  def play
    secret_word_length = @setter.set_secret_word
    @guesser.set_secret_length(secret_word_length)

  end

  def take_turn

  end

  def update

  end

  def won?

  end
end

class ComputerPlayer
  def initialize
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
  end

  def set_secret_word
    @secret_word = @dictionary.sample

    @secret_word.length
  end

  def set_secret_length(length)
    @candidate_word_list = @dictionary.dup.select do |word|
      word.length == length
    end
  end
end

class HumanPlayer
  def initialize
    
  end

  def set_secret_word
    begin
      print "Think of a word, but don't tell it to me.  How long is it? > "
      Integer(gets.chomp)
    rescue ArgumentError
      puts "The length of a word should really be a number."
      retry
    end
  end

  def set_secret_length(length)
    puts "Your opponent's secret word is #{length} letters long."
  end
end