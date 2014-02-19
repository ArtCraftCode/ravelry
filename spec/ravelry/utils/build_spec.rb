require_relative '../../spec_helper'

describe Ravelry::Build do
  context 'author' do
    before do
      @author = Ravelry::Build.author(paid_pattern_stub)
    end

    it 'exists' do
      expect(@author).to be
    end

    it 'returns an instance of Author' do
      expect(@author).to be_instance_of(Ravelry::Author)
    end
  end

  context 'categories' do
  end

  context 'craft' do
  end

  context 'needles' do
  end

  context 'packs' do
  end

  context 'photos' do
  end

  context 'printings' do
  end

  context 'type' do
  end

  context 'yarns' do
  end

  context 'yarn_weights' do
  end
end