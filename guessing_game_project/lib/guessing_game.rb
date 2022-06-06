# class GuessingGame

#     def initialize(min,max)
#         @secret_num = rand(min..max)
#         @num_attempts = 0
#         @game_over = false
#     end

#     def num_attempts
#         @num_attempts
#     end

#     def game_over?
#         @game_over
#     end

#     def check_num(num)
#     @num_attempts += 1
#         if num == @secret_num
#             @game_over = true
#             print "you win"
#         elsif num > @secret_num
#             print "too big"
#         elsif num < @secret_num
#             print "too small"
#         end
#     end
    
#     def ask_user
#     print "enter a number"
#     response = gets.chomp
#     check_num(response.to_i)
#     end
        
# end


class GuessingGame
    attr_reader :num_attempts

    def initialize(min,max)

        @secret_num = rand(min..max)

        @num_attempts = 0

        @game_over = false
    end

    def game_over? #when the getter doesn't match the variable, you cannot do attr_reader
        @game_over
    end


    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            puts "you win!"
            @game_over = true
        elsif num > @secret_num
            puts "too big!"
        elsif num < @secret_num
            puts "too small!"
        end
    end

    def ask_user
        puts "enter a number"
        resp = gets.chomp
        check_num(resp.to_i)
    end

end