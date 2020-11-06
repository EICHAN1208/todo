require './lib/task'
require './lib/renderer'

class Router
  attr_reader :argv_0, :argv_1, :argv_2, :argv_3

  def initialize(argv_0, argv_1, argv_2, argv_3)
    @argv_0 = argv_0
    @argv_1 = argv_1
    @argv_2 = argv_2
    @argv_3 = argv_3
  end

  def route
    task_finder = TaskFinder.new
    case @argv_0
    when '--help'
      puts Renderer.render_help_option
    when 'add'
      Task.add(argv_3, argv_1)
      task_finder = TaskFinder.new
      puts task_finder.add
    when 'done'
      task = Task.new('', '', '', '')
      task.done(argv_1)
      task_finder = TaskFinder.new
      puts task_finder.done(argv_1)
    when 'all'
      puts task_finder.all
    when 'today'
      puts task_finder.today
    when 'archived'
      puts task_finder.archived
    end
  end
end
