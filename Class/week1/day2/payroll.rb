#require 'pry'
class Employee
  WEEKS_IN_YEAR = 48
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

class HourlyEmployee < Employee
  def initialize(name, email, hourly_rate, hours_worked)
    super(name, email)
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end
  def calculate_salary
    @hourly_rate * @hours_worked
  end
end

class SalariedEmployee < Employee
  def initialize(name, email, yearly_salary)
    super(name, email)
    @yearly_salary = yearly_salary
  end
  def calculate_salary
    @yearly_salary/WEEKS_IN_YEAR
  end
end

class MultiPaymentEmployee < Employee
  def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
    super(name, email)
    @fixed_yearly_salary = yearly_salary
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end
  def calculate_salary
    @fixed_yearly_salary/WEEKS_IN_YEAR + @hourly_rate * @hours_worked
  end
end

class Payroll
  TAX = 0.18
  def initialize(employees)
    @employees = employees
  end
  #binding.pry
  def notify_employees(employee)
    puts "We've sent a payment notification to #{employee.email}"
    puts "***"
    puts "Dear #{employee.name}, you've been paid."
    puts " "
  end
  def pay_employees
    salary_total = 0
    @employees.each do |employee|
      salary_total += employee.calculate_salary
      puts "#{employee.name} --> #{employee.calculate_salary}"
    end
    puts "-----------------------------"
    puts "Payroll for this week #{salary_total} with tax included"
    puts "Payroll for this week #{salary_total - salary_total * TAX} without tax"
  end
end




all_employees = [
miguel = HourlyEmployee.new("Miguel", "miguel@mail.com", 50, 40),
mathias = SalariedEmployee.new("Mathias", "mathias@mail.com", 40000),
marjon = MultiPaymentEmployee.new("Marjon", "marjon@mail.com",40000, 50, 40)
]

t = Time.now
thisweek = Payroll.new(all_employees)
puts "#{t.year}/#{t.month}/#{t.day}"
puts "-----------------------------"
puts thisweek.pay_employees

thisweek.notify_employees(miguel)
