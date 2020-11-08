require './lib/task'
require './lib/renderer'

class Router
  attr_reader :renderer, :task

  def initialize
    @renderer = Renderer.new
    @task = Task.new(nil, nil, nil, nil)
  end

  def route(argv_0, argv_1, argv_2, argv_3)
    case argv_0
    when '--help'
      puts renderer.render_help_option
    when 'add'
      Task.add(argv_1, argv_2, argv_3)
      puts task_finder.add
    when 'done'
      task.done(argv_1)
      puts task_finder.done(argv_1)
    when 'all'
      puts task_finder.all
    when 'today'
      puts task_finder.today
    when 'archived'
      puts task_finder.archived
    end
  end

  private

  def task_finder
    TaskFinder.new
  end
end
