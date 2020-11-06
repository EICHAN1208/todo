require 'securerandom'
require 'json'
require 'date'
require './lib/storage'
require './lib/task_finder'

class Task
  attr_accessor :id, :due_date, :completed_at, :title

  def initialize(id, due_date, completed_at, title)
    @id = id
    @due_date = due_date
    @completed_at = completed_at
    @title = title
  end

  def self.add(due_date, title)
    due_date = Date.parse(due_date).strftime unless due_date.nil?
    Storage.write(new(SecureRandom.hex(3), due_date, nil, title))
  end

  def done(id)
    storage = Storage.new
    tasks = storage.read
    tk = tasks.map do |task|
      task[2] = Date.today.strftime if task[0] == id
      task
    end

    t = tk.map do |a|
      task = Task.new(nil, nil, nil, nil)
      task.id = a[0]
      task.due_date = a[1]
      task.completed_at = a[2]
      task.title = a[3]
      task
    end
    storage.write(t)
  end
end
