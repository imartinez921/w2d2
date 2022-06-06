# class Hangman
#   DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
# def Hangman.random_word
#   DICTIONARY.sample
# end

# def initialize
#   @secret_word = Hangman.random_word
#   @guess_word = Array.new(@secret_word.length, "_")
#   @attempted_chars = []
#   @remaining_incorrect_guesses = 5
# end

# def guess_word
#   @guess_word
# end

# def attempted_chars
#   @attempted_chars
# end

# def remaining_incorrect_guesses
#   @remaining_incorrect_guesses
# end

# def already_attempted?(char)
#   @attempted_chars.include?(char) ? true : false
# end


# def get_matching_indices(char)
#   ansArr = []
#     @secret_word.each_char.with_index do |currentChar, i|
#       ansArr << i if currentChar == char
#     end
#   return ansArr
# end

# def fill_indices(char,indexArr)
#   indexArr.each do |index|
#     @guess_word[index] = char
#   end
#   return indexArr
# end

# def try_guess(char)
#   @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
#   if already_attempted?(char)
#     print "That has already been attempted."
#     return false
#   else
#     @attempted_chars << char
#     matchingIdxs = self.get_matching_indices(char)
#     self.fill_indices(char, matchingIdxs)
#     return true
#   end
# end

# def ask_user_for_guess
#   print "Enter a char:"
#   response = gets.chomp
#   try_guess(response)
# end

# def win?
#   if @guess_word.join("") == @secret_word
#     print "WIN"
#     return true
#   else
#     return false
#   end
# end

# def lose?
#   if @remaining_incorrect_guesses == 0
#     print "LOSE"
#     return true
#   else return false
#   end
# end

# def game_over?
#   if win? || lose?
#     print @secret_word
#     return true
#   else
#     return false
#   end
# end


# end




class Hangman
    attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
    
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

    def Hangman.random_word
        return DICTIONARY.sample
    end

    def initialize
        @secret_word = Hangman.random_word
        
        @guess_word = Array.new(@secret_word.length, "_")

        @attempted_chars = []

        @remaining_incorrect_guesses = 5
    end

    def already_attempted?(char)
        if @attempted_chars.include?(char)
            return true
        else return false
        end
    end

    def get_matching_indices(char)
        indices = [] #make sure you don't call map on a string!!!
        @secret_word.each_char.with_index do |letter, i|
            indices << i if letter == char
        end
        return indices
    end

    def fill_indices(char,indexArr)
        indexArr.each do |ele|
            @guess_word[ele] = char
        end
    end
    
    def try_guess(char)
        if !@secret_word.include?(char) #needs to be before returns to be read!
            @remaining_incorrect_guesses -= 1
        end
        if already_attempted?(char)
            puts "that has already been attempted"
            return false
        else
            @attempted_chars << char
            indexArr = get_matching_indices(char)
            fill_indices(char, indexArr)
            return true
        end
    end

    def ask_user_for_guess
        puts "Enter a char:"
        resp = gets.chomp
        return try_guess(resp)
    end

    def win?
        if @guess_word.join("") != @secret_word #make sure to match data types!!!
            return false
        else 
            puts "WIN"
            return true
        end
    end

    def lose?
        if @remaining_incorrect_guesses == 0
            puts "LOSE"
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            puts "#{@secret_word}"
            return true
        else
            return false
        end
    end


end