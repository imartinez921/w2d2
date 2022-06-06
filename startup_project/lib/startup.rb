# require_relative "./employee.rb"

# class Startup
#     attr_reader :name, :funding, :salaries, :employees

#     def initialize(name,funding,salaries)

#         @name = name

#         @funding = funding

#         #you are NOT creating this hash! It is given. "salaries (hash) containing `title` => `salary` pairs"
#         @salaries = salaries

#         @employees = []
#     end

#     def valid_title?(new_title)
#         return @salaries.has_key?(new_title)
#     end

#     def >(other_startup)
#         return self.funding > other_startup.funding
#     end

#     def hire(name,title)
#         if valid_title?(title)
#             @employees << Employee.new(name,title)
#         else
#             raise "This title is invalid!"
#         end
#     end

#     def size
#         @employees.length
#     end

#     def pay_employee(employee)
#         salary = @salaries[employee.title]
#         if @funding >= salary
#             employee.pay(salary)
#             @funding -= salary
#         else raise "We don't have enough money!"
#         end
        
#     end

#     def payday
#         @employees.each {|employee| pay_employee(employee)}
#     end

#     def average_salary
#         sum = 0
#         employees.each do |employee|
#             sum += @salaries[employee.title]
#         end
#         sum / employees.length
#     end

#     def close
#         @employees = []
#         @funding = 0
#     end

#     def acquire(other_startup)
#         @funding += other_startup.funding

#         other_startup.salaries.each do |title, salary|
#             if !@salaries.has_key?(title)
#                 @salaries[title] = salary
#             end
#         end
#         @employees += other_startup.employees
#         other_startup.close
#     end



# end


require_relative "./employee.rb"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
#   salaries (hash) containing `title` => `salary` pairs
        @employees = []
    end

    def valid_title?(title)
        salaries.keys.include?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding ? true : false
    end

    def hire(employeename, title)
        if !valid_title?(title)
            raise "ERROR"
        else
            @employees << Employee.new(employeename, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment = @salaries[employee.title]
        if @funding < payment #could not be self
            raise "not enough money!"
        else
            employee.pay(payment)
            @funding -= payment #could not be self
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end
        return total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each do |title, salary|
            if !@salaries.keys.include?(title)
                @salaries[title] = salary
            end
        end
        # other_startup.employees.each do |employee|
        #     @employees << employee
        # end 
        # @employees + other_startup.employees #did not work!
        # @employees.concat(other_startup.employees) # this does work
        @employees += other_startup.employees #this does work
        other_startup.close
    end


end


