require './lib/task'
require 'date'

RSpec.describe 'Task' do
  let(:tasks) { Storage.new.read }

  describe '#self.add' do
    context '日付を指定する場合' do
      it '日付を指定してタスクが1件追加される' do
        Task.add('11/4', 'タスク')
        expect(tasks.last[1]).to eq('2020-11-04')
        expect(tasks.last[3]).to eq('タスク')
      end
    end

    context '日付を指定しない場合' do
      it '日付なしのタスクが1件追加される' do
        Task.add(nil, 'タスク')
        expect(tasks.last[1]).to eq(nil)
        expect(tasks.last[3]).to eq('タスク')
      end
    end
  end

  describe '#done' do
    let(:task) { Task.new(nil, nil, nil, nil) }

    context '指定したidが存在しない場合' do
      it 'タスクデータに変化はない' do
        task.done('1111')
        expect(tasks).to eq(tasks)
      end
    end

    context '存在するidを指定した場合' do
      before do
        Task.add(nil, 'タスク')
      end

      it '完了日に今日の日付が入る' do
        task.done(tasks.last[0])
        tasks = Storage.new.read
        expect(tasks.last[2]).to eq(Date.today.strftime)
      end
    end
  end
end
