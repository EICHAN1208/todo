require './lib/storage'
require './lib/renderer'

class TaskFinder
  attr_accessor :tasks, :renderer

  def initialize
    @tasks = Storage.new.read
    @renderer = Renderer.new
  end

  def add
    tasks = @tasks.last
    @renderer.render([tasks])
  end

  def done(id)
    tasks = @tasks.select { |task| task[0] == id }
    @renderer.render(tasks)
  end

  def all
    tasks = @tasks.select { |task| task[2].nil? }
    @renderer.render(tasks)
  end

  def today
    tasks = @tasks.select { |task| task[1] == Date.today.strftime }
    @renderer.render(tasks)
  end

  def archived
    tasks = @tasks.reject { |task| task[2].nil? }
    @renderer.render(tasks)
  end
end
