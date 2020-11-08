require 'csv'

class Storage
  attr_reader :tasks

  def write(task)
    CSV.open('./tmp/tasks.csv', 'a') do |file|
      file << create_task_elements(task)
    end
  end

  def renew(tasks)
    CSV.open('./tmp/tasks.csv', 'w') do |file|
      tasks.each do |task|
        file << create_task_elements(task)
      end
    end
  end

  def read
    CSV.read('./tmp/tasks.csv')
  end

  private

  def create_task_elements(task)
    [task.id, task.due_date, task.completed_at, task.title]
  end
end
