require_relative "./room.rb"

class Hotel
    attr_reader :rooms
    
    def initialize(name, hash) #initialize variables are ways we can call self!
        @name = name
        @rooms = {}
            hash.each do |roomname, capacity|
                @rooms[roomname] = Room.new(capacity)
            end

    end
        
    def name
        wordsArr = @name.split(" ")
        wordsArr.map! {|ele| ele.capitalize}
        wordsArr.join(" ")
    end

    def room_exists?(roomname)
        lowercase = @rooms.keys.map {|ele| ele.downcase}
        if lowercase.include?(roomname.downcase)
            return true
        else return false
        end
    end

    def check_in(person,roomname)
        if !room_exists?(roomname)
            puts "sorry, room does not exist"
        else
            if !@rooms[roomname].add_occupant(person)
                puts "sorry, room is full"
                return false
            else
                puts "check in successful"
            end
        end
    end

    def has_vacancy? #Specs specify we need need to call a room function. How do we call each room? What line is Room.new called? => @rooms (which is a hash)
        #Room initialization has only one (CAPACITY) arg. This also means capacity is a way to call a room because it's an initialization argument.
        # Capacity is the only way we can call a room function on the hotel page.
        @rooms.values.each do |capacity| #values of the hash are where the hotel capacities are held
            if capacity.full? 
            return false 
            end
        return true
        end
    end

    def list_rooms
        @rooms.each do |key, value|
            puts key + " " + value.available_space.to_s
        end
    end




end
