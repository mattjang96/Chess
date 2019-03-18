require "byebug"

class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss 
        unless @boss.nil?
            debugger
            @boss.add_direct_report(self)
        end
    end  

    def bonus(multiplier)
        # bonus = (employee salary) * multiplier
        @salary * multiplier
    end

end 

class Manager < Employee

    attr_accessor :subordinates

    def initialize(name, title, salary, boss)
        super
        @subordinates = []
    end

    def bonus(multiplier)   
        # bonus = (total salary of all sub-employees) * multiplier
        salaries = @subordinates.map { |employee| employee.salary }
        salaries.sum * multiplier
    end
    
    def add_direct_report(employee)
       queue = [employee]
       until queue.empty? 
         @subordinates << queue.shift
         queue += employee.subordinates if (employee.class == Manager) && !(employee.subordinates.nil?)
       end  
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 76000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000