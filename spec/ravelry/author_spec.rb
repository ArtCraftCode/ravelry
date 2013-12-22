require_relative '../spec_helper'
require_relative '../../lib/ravelry/author'

describe Ravelry::Author do
  before do
    @author = Ravelry::Author.new(pattern_author)
  end

  it 'creates an instance of Author' do
    expect(@author).to be_instance_of(Ravelry::Author)
  end

  context 'has reader attributes for' do
    it 'id' do
      expect(@author.id).to be
    end

    it 'name' do
      expect(@author.name).to be
    end

    it 'permalink' do
      expect(@author.permalink).to be
    end

    it 'patterns_count' do
      expect(@author.patterns_count).to be
    end

    it 'favorites_count' do
      expect(@author.favorites_count).to be
    end
  end

  context 'sets reader attributes for' do
    it 'id' do
      expect(@author.id).to eq(@author.id)
    end

    it 'name' do
      expect(@author.name).to eq(@author.name)
    end

    it 'permalink' do
      expect(@author.permalink).to eq(@author.permalink)
    end

    it 'patterns_count' do
      expect(@author.patterns_count).to eq(@author.patterns_count)
    end

    it 'favorites_count' do
      expect(@author.favorites_count).to eq(@author.favorites_count)
    end
  end
end