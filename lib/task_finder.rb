require './lib/storage'
require './lib/renderer'

class TaskFinder
  attr_accessor :tasks, :renderer

  def initialize
    @tasks = Storage.new.read
    @renderer = Renderer.new
  end

  def add
    renderer.render([tasks.last])
  end

  def done(id)
    done_task = tasks.select { |task| task[0] == id }
    renderer.render(done_task)
  end

  def all
    all_tasks = tasks.select { |task| completed_at_nil?(task) }
    renderer.render(all_tasks)
  end

  def today
    today_tasks = tasks.select { |task| today?(task) }
    renderer.render(today_tasks)
  end

  def archived
    archived_tasks = tasks.reject { |task| completed_at_nil?(task) }
    renderer.render(archived_tasks)
  end

  private

  def today?(task)
    task[1] == Date.today.strftime
  end

  def completed_at_nil?(task)
    task[2].nil?
  end
end
