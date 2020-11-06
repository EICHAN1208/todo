require './lib/task'

RSpec.describe 'Task' do
  describe '#self.add' do
    subject { Task.add(due_date, title) }

    let(:due_date) { '11/4' }
    let(:title) { 'タスク' }

    it 'addメソッドが呼ばれることでタスクインスタンスが作られ、due_dateとtitleが初期化される' do
      expect(subject.due_date).to eq '11/4'
      expect(subject.title).to eq 'タスク'
    end
  end
end
