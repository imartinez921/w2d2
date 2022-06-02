# require_relative "./room.rb"

class Hotel

    def initialize (name,hash)
        @name = name
        
        @rooms = {}
        hash.each do |key, value|
            @rooms[key] = Room.new(value) #this is the Self value used in Room file
        end

    end

    def name
        namesArr = @name.split(" ")
        namesArr.map {|ele| ele.capitalize}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        return @rooms.has_key?(room_name)
    end

    def check_in(person,room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person) #need to refer to Room by its capacity AKA key
                print "check in successful"
            else
                print "sorry, room is full"
            end 
        else
            print "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each_value do |capacity|
            if !capacity.full?
                return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |key, value|
            puts key + ":" + value.available_space.to_s
        end
    end
            


  
end

