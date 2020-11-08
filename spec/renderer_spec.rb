require './lib/renderer'

RSpec.describe 'Renderer' do
  describe 'render_help_option' do
    subject { Renderer.new.render_help_option }

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

  describe '#render' do
    let(:renderer) { Renderer.new }

    context 'タスクがない場合' do
      it 'no tasksと表示される' do
        tasks = []
        expect(renderer.render(tasks)).to eq('no tasks')
      end
    end

    context 'タスクを追加した場合' do
      let(:renderer) { Renderer.new }

      it '指定の形式で表示できる' do
        text = <<~TEXT.chomp
          id             due_date       completed_at        title          
          7e9b41         2020-11-10                         タスク            
        TEXT
        tasks = [['7e9b41', '2020-11-10', nil, 'タスク']]
        expect(renderer.render(tasks)).to eq(text)
      end
    end
  end
end