require 'yaml/store'

class Task
  T = Time.now
    attr_reader :content, :id, :completed, :created_at, :updated_at
    @@current_id = 1
    def initialize(content, completed = false, updated_at = nil)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @created_at = Time.now
        @completed = completed
        @updated_at = updated_at
    end
    def complete!
      @completed = true
    end
    def make_incomplete!
      @completed = false
    end
    def update_content!(new_content)
      @content = new_content
      @updated_at = T
    end
end

class TodoList
    attr_reader :tasks, :user
    def initialize(user)
      @user = user
      @tasks = []
      @todo_store = YAML::Store.new("tasks.yml")
    end
    def add_task(task)
      @tasks.push(task)
    end
    def delete_task(id)
      @tasks.each_with_index do |task, index|
        if id == task.id
          @tasks.delete_at(index)
        end
      end
      return @tasks
    end
    def find_task_by_id(id)
      @tasks.each do |task|
        if id == task.id
          return task.content
        else
          return nil
        end
      end
    end

    def sort_by_created!(option = "ASC")
      # puts "Would you like to sort in asceding (ASC) or descending (DESC) order?"
      # option = gets.chomp
      if option == "ASC"
        @tasks.sort!{|task1, task2| task1.created_at <=> task2.created_at}
        # sorted_tasks.each do |task|
        #   puts "#{task.id}   #{task.content}   #{task.created_at}"
        # end
      elsif option == "DESC"
        @tasks.sort!{|task1, task2| task2.created_at <=> task1.created_at}
        # sorted_tasks.each do |task|
        #   puts "#{task.id}   #{task.content}   #{task.created_at}"
        # end
      else
        puts "Sorry, I don't understand what you'd like to do."
      end
      return @tasks
    end

    def show_tasks
      sorted_tasks = @tasks.sort { | task1, task2 | task1.id <=> task2.id }
      sorted_tasks.each do |task|
        puts "#{task.id}   #{task.content}   #{task.completed}"
      end
      return sorted_tasks
    end
end

module SaveTasks
  def save
    @todo_store.transaction do
        @todo_store[@user] = @tasks
    end
  end
end

my_to_do_list = TodoList.new("Alina")
task = Task.new("Buy the dog")
task2 = Task.new("Walk the milk")
task3 = Task.new("do this")
task4 = Task.new("Another task")
task5 = Task.new("A red task")
task6 = Task.new("Alina's task")
task7 = Task.new("Task for Marjon")
task8 = Task.new("Task for Marjon")
task9 = Task.new("So many tasks")
puts "\n"
my_to_do_list.add_task(task)
my_to_do_list.add_task(task2)
my_to_do_list.add_task(task3)
my_to_do_list.add_task(task4)
my_to_do_list.add_task(task6)
my_to_do_list.add_task(task5)
my_to_do_list.extend SaveTasks

my_to_do_list.show_tasks
puts "\nInitial length: #{my_to_do_list.tasks.length}\n\n"
my_to_do_list.add_task(task6)
my_to_do_list.add_task(task7)
my_to_do_list.add_task(task8)
my_to_do_list.show_tasks
my_to_do_list.extend SaveTasks
my_to_do_list.save

puts "\nLater today length: #{my_to_do_list.tasks.length}\n\n"
