# Learning Goals

# Understand how a subclass inherits from a superclass
# Know how to override a parent class's method
# Know when and how to use super

# Employee and Manager

# Write a class Employee that has attributes that return the employee's name, title, salary, and boss.

# Write another class, Manager, that extends Employee. Manager should have an attribute that holds an array of all employees assigned to the manager. Note that managers might report to higher level managers, of course.

# Add a method, bonus(multiplier) to Employee. Non-manager employees should get a bonus like this

# bonus = (employee salary) * multiplier

# Managers should get a bonus based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.

# bonus = (total salary of all sub-employees) * multiplier

# # Testing

# # If we have a company structured like this:

# # Name	    Salary	        Title	    Boss
# # Ned	    \$1,000,000	    Founder	    nil
# # Darren    \$78,000	    TA Manager	Ned
# # Shawna    \$12,000	    TA	        Darren
# # David	    \$10,000	    TA	        Darren


# based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.
require "byebug"

class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        return salary * multiplier
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) unless boss.nil?
        boss
    end

end


class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(worker)
        employees << worker

        worker
    end

    def bonus(multiplier)
        totals * multiplier
    end

    def totals
        total = 0
        employees.each do |worker|
            if worker.is_a?(Manager)
                total += worker.salary + worker.totals
            else
                total += worker.salary
            end
        end
        total
    end
end


p david = Employee.new("david", "TA", 10000, "darren")
p shawna = Employee.new("shawna", "TA", 12000, "darren")
p darren = Manager.new("darren", "TA Manager", 78000, "ned")
p ned = Manager.new("ned", "Founder", 1000000)

p darren.add_employee(david)
p darren.add_employee(shawna)
p ned.add_employee(darren)
p darren.employees
p ned.employees

p ned.bonus(5)      # => 500_000
p darren.bonus(4)   # => 88_000
p david.bonus(3)    # => 30_000
p shawna.bonus(3)    # => 36_000