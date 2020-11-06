require './lib/renderer'

RSpec.describe 'Renderer' do
  describe 'render_help_option' do
    subject { Renderer.render_help_option }

    it 'コマンドの説明が表示される' do
      text = <<~TEXT
        Options:\n-h, --help output usage information\n
        Commands:\nadd [task title [-d|--due=(YYYY/)MM/DD]
        Add a task\n\nall\nOutput all not-completed tasks\n
        today\nOutput tasks that due until today\n
        archived\nOutput completed tasks\n\ndone [ID]
        Mark a task as done
      TEXT
      expect(subject).to eq(text)
    end
  end
end