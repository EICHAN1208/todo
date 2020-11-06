require './lib/task_finder'
require './lib/task'
require 'date'

RSpec.describe 'TaskFinder' do
  let(:task_finder) { TaskFinder.new }
  let(:tasks) { Storage.new.read }

  describe '#add' do
    subject { task_finder.add }

    context 'addした場合' do
      before do
        Task.add(nil, 'タスク')
      end

      it 'addしたタスクが選択される' do
        expect(tasks.last[3]).to eq('タスク')
      end
    end
  end

  # describe '#done' do
  #   subject { task_finder.done(id) }

  #   context 'doneした場合' do
  #     let(:id) { tasks.last[0] }
  #     before do
  #       Task.add(nil, 'タスクタスク')
  #       task = Task.new(nil, nil, nil, nil)
  #       task.done(tasks.last[0])
  #     end

  #     it 'doneしたタスクが選択される' do
  #       expect(tasks.last).to eq 1
  #     end
  #   end
  # end

  describe '#all' do
    context '' do
      
    end
  end
end