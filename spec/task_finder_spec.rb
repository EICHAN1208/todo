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

  describe '#done' do
    subject { task_finder.done(id) }

    context 'doneした場合' do
      let(:id) { tasks.last[0] }

      before do
        Task.add(nil, 'タスクタスク')
        task = Task.new(nil, nil, nil, nil)
        task.done(tasks.last[0])
      end

      it '指定したidのタスクが選択されcompleted_atに日付が入る' do
        tasks = Storage.new.read
        expect(tasks.last[2]).to eq(Date.today.strftime)
      end
    end
  end

  describe '#all' do
    context 'allした場合' do
      it 'completed_atに日付が入っていないタスク数と同じ数取得できる' do
        size = tasks.select { |task| task[2].nil? }.size
        expect(task_finder.all.count("\n")).to eq size
      end
    end
  end

  describe '#today' do
    let(:today_date) { Date.today.strftime }

    context 'todayした場合' do
      before do
        Task.add(today_date, 'タスクタスク')
      end

      it 'due_dateが今日の日付になっているタスク数と同じ数取得できる' do
        size = tasks.select { |task| task[1] == today_date }.size
        expect(task_finder.today.count("\n")).to eq size
      end
    end
  end

  describe '#archived' do
    context 'archivedした場合' do
      context 'タスクがある場合' do
        it 'completed_atに日付が入っているタスク数と同じ数取得できる' do
          size = tasks.reject { |task| task[2].nil? }.size
          expect(task_finder.archived.count("\n")).to eq size
        end
      end
    end
  end
end
