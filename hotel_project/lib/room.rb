# class Room
  
#     def initialize(capacity)
#         @capacity = capacity

#         @occupants = []
#     end

#     def capacity
#         @capacity
#     end

#     def occupants
#         @occupants
#     end

#     def full?
#         return false if @occupants.length < @capacity
#         return true if @occupants.length == @capacity
#     end

#     def available_space
#         return @capacity - @occupants.length
#     end

#     def add_occupant(name)
#         if self.full?
#             return false
#         else
#             @occupants << name
#             return true
#         end
#     end


# end


class Room
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @occupants = []
        @capacity = capacity
    end

    def full?
        return true if @occupants.length >= @capacity
        return false
    end

    def available_space
        @capacity - occupants.length
    end

    def add_occupant(name)
        if !full?
            @occupants << name
            return true
        else 
            return false
        end
    end



end