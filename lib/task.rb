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

  def self.add(title, option, due_date)
    return if title.nil?

    due_date = Date.parse(due_date).strftime if ['-d', '--due'].include?(option)
    Storage.new.write(new(SecureRandom.hex(3), due_date, nil, title))
  end

  def done(id)
    storage = Storage.new
    tasks = storage.read
    renew_tasks = tasks.map do |task|
      task[2] = create_today if task[0] == id
      task
    end

    _tasks = renew_tasks.map do |renew_task|
      task = Task.new(nil, nil, nil, nil)
      task.id = renew_task[0]
      task.due_date = renew_task[1]
      task.completed_at = renew_task[2]
      task.title = renew_task[3]
      task
    end
    storage.renew(_tasks)
  end

  private

  def create_today
    Date.today.strftime
  end
end
