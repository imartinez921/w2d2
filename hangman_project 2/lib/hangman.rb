class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
def Hangman.random_word
  DICTIONARY.sample
end

def initialize
  @secret_word = Hangman.random_word
  @guess_word = Array.new(@secret_word.length, "_")
  @attempted_chars = []
  @remaining_incorrect_guesses = 5
end

def guess_word
  @guess_word
end

def attempted_chars
  @attempted_chars
end

def remaining_incorrect_guesses
  @remaining_incorrect_guesses
end

def already_attempted?(char)
  @attempted_chars.include?(char) ? true : false
end


def get_matching_indices(char)
  ansArr = []
    @secret_word.each_char.with_index do |currentChar, i|
      ansArr << i if currentChar == char
    end
  return ansArr
end

def fill_indices(char,indexArr)
  indexArr.each do |index|
    @guess_word[index] = char
  end
  return indexArr
end

def try_guess(char)
  @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
  if already_attempted?(char)
    print "That has already been attempted."
    return false
  else
    @attempted_chars << char
    matchingIdxs = self.get_matching_indices(char)
    self.fill_indices(char, matchingIdxs)
    return true
  end
end

def ask_user_for_guess
  print "Enter a char:"
  response = gets.chomp
  try_guess(response)
end

def win?
  if @guess_word.join("") == @secret_word
    print "WIN"
    return true
  else
    return false
  end
end

def lose?
  if @remaining_incorrect_guesses == 0
    print "LOSE"
    return true
  else return false
  end
end

def game_over?
  if win? || lose?
    print @secret_word
    return true
  else
    return false
  end
end


end


