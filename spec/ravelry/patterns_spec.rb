require_relative '../spec_helper'
require_relative '../../lib/ravelry/patterns'

describe Ravelry::Patterns do

  context '#initialize' do
    it 'should return an error when not given a argument' do
      expect { Ravelry::Patterns.new }.to raise_error(ArgumentError)
    end
  end

  context '#fetch_and_parse' do
    before do
      @api = initialize_paid
    end

    it 'should succeed' do
      expect(@api).to be
    end

    it 'should return a pattern' do
      expect(@api.pattern).to be
    end

    it 'should return a hash' do
      expect(@api.pattern).to be_kind_of(Hash)
    end
  end
end