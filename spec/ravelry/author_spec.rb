require_relative '../spec_helper'

describe Ravelry::Author do
  before do
    @author = Ravelry::Author.new(pattern_author)
  end

  it 'creates an instance of Author' do
    expect(@author).to be_instance_of(Ravelry::Author)
  end

  context 'has and sets reader attributes for' do
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