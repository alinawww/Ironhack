require 'rspec'
require './sinatra1'
require 'yaml/store'

# creating new tasks, deleting tasks, updating tasks, completing tasks, and maybe even a few more surprises.
describe Task do
  subject { described_class.new("Buy the milk") }

  describe "#complete!" do
    it "completes an existent task" do
      subject.complete!
      expect(subject.completed).to be true
    end
  end

  describe "#make_incomplete!" do
    it "makes incomplete an existent task" do
      subject.make_incomplete!
      expect(subject.completed).to be false
    end
  end

  # with updated_at won't work because the time now will always be different
  # describe "#update_content!" do
  #   it "updates the content of an existent task" do
  #     result = subject.update_content!("the other content")
  #     expect(result).to eq("the other content")
  #   end
  # end
end

describe TodoList do
attr_accessor :subject, :mytask
  before(:each) do
    @secondtask = Task.new("this one as well")
    @mytask = Task.new("to be deleted")
    @subject = TodoList.new("user")
    @subject.add_task(@mytask)
  end

  describe "#add_task" do
    it "add a new task to the list" do
      @subject.add_task("new")
      expect(@subject.tasks).to include("new")
    end
  end

  describe "#delete_task" do
    it "deletes a task from the list" do
      # result = todolist.delete_task(mytask.id)
      expect(@subject.delete_task(@mytask.id).length).to eq(0)
    end
  end

  describe "#find_task_by_id" do
    it "finds a task by a given id" do
      expect(@subject.find_task_by_id(@mytask.id)).to eq(@mytask.content)
    end
  end

  describe "#sort_by_created" do
    it "sorts the tasks in an ascending order" do
      @subject.add_task(@secondtask)
      @subject.sort_by_created!
      condition = @subject.tasks[0].created_at < @subject.tasks[1].created_at
        expect(condition).to be true
    end
  end

  describe "#sort_by_created" do
    it "sorts the tasks in a descending order" do
      @subject.add_task(@secondtask)
      @subject.sort_by_created!("DESC")
      desc_condition = @subject.tasks[0].created_at > @subject.tasks[1].created_at
        expect(desc_condition).to be true
    end
  end
end

describe SaveTasks do
  describe TodoList
    before(:each) do
      @mytask = Task.new("to be deleted")
      @subject = TodoList.new("user")
      @subject.add_task(@mytask)
      @todo_store = YAML::Store.new("tasks-test.yml")
    end
  end

  describe "#save" do
    mytasks = YAML.load_file("tasks-test.yml")
    expect(mytasks.fetch('user')['content']).to eq(@mytask.content)
  end
  mytasks.fetch('user')['content']
