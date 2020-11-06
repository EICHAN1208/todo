require 'csv'

class Storage
  attr_reader :tasks

  def self.write(task)
    CSV.open('./tmp/tasks.csv', 'a') do |file|
      file << [task.id, task.due_date, task.completed_at, task.title]
    end
  end

  def write(tasks)
    CSV.open('./tmp/tasks.csv', 'w') do |file|
      tasks.each do |task|
        file << [task.id, task.due_date, task.completed_at, task.title]
      end
    end
  end

  def read
    CSV.read('./tmp/tasks.csv')
  end
end
