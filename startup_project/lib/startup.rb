require_relative "./employee.rb"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name,funding,salaries)

        @name = name

        @funding = funding

        #you are NOT creating this hash! It is given. "salaries (hash) containing `title` => `salary` pairs"
        @salaries = salaries

        @employees = []
    end

    def valid_title?(new_title)
        return @salaries.has_key?(new_title)
    end

    def >(other_startup)
        return self.funding > other_startup.funding
    end

    def hire(name,title)
        if valid_title?(title)
            @employees << Employee.new(name,title)
        else
            raise "This title is invalid!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else raise "We don't have enough money!"
        end
        
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        other_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += other_startup.employees
        other_startup.close
    end



end
