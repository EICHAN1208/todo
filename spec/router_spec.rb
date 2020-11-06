require './lib/router'

RSpec.describe 'Router' do
  subject { Router.new(argv_0, nil, nil, nil) }

  describe 'route' do

    context 'helpコマンドの場合' do
      let(:argv_0) { '--help' }

      it 'helpコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq '--help'
      end
    end

    context 'addコマンドの場合' do
      let(:argv_0) { 'add' }

      it 'addコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq 'add'
      end
    end

    context 'doneコマンドの場合' do
      let(:argv_0) { 'done' }

      it 'doneコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq 'done'
      end
    end

    context 'allコマンドの場合' do
      let(:argv_0) { 'all' }

      it 'allコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq 'all'
      end
    end

    context 'todayコマンドの場合' do
      let(:argv_0) { 'today' }

      it 'todayコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq 'today'
      end
    end

    context 'archivedコマンドの場合' do
      let(:argv_0) { 'archived' }

      it 'archivedコマンド内の処理に割り振られる' do
        expect(subject.argv_0).to eq 'archived'
      end
    end
  end
end