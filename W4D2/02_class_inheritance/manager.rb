
# require_relative "./employee.rb"

# class Manager < Employee
#     attr_reader :employees
#     def initialize
#         super(name, title, salary, boss = nil)
#         @employees = []
#     end

#     def add_employee(worker)
#         employees << worker
#         worker
#     end

#     def bonus(multiplier)
#         total = 0
#         employees.each do |worker|
#             total += worker.salary
#         end
#         return total * multiplier
#     end
# end