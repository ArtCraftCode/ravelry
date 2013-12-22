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
    end

    it 'name' do
    end

    it 'permalink' do
    end

    it 'patterns_count' do
    end

    it 'favorites_count' do
    end
  end
end