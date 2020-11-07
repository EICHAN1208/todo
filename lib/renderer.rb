class Renderer
  def self.render_help_option
    <<~TEXT
      Options:\n-h, --help output usage information\n
      Commands:\nadd [task title [-d|--due=(YYYY/)MM/DD]
      Add a task\n\nall\nOutput all not-completed tasks\n
      today\nOutput tasks that due until today\n
      archived\nOutput completed tasks\n\ndone [ID]
      Mark a task as done
    TEXT
  end

  def render(tasks)
    return 'no tasks' if empty?(tasks)

    text = format('%-15s%-15s%-20s%-15s', 'id', 'due_date', 'completed_at', 'title')
    tasks.each do |task|
      text += "\n" + format('%-15s%-15s%-20s%-15s', task[0], task[1], task[2], task[3])
    end
    text
  end

  private

  def empty?(tasks)
    tasks.size.zero?
  end
end
