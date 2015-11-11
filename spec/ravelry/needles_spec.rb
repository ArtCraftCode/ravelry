require_relative '../spec_helper'

describe Ravelry::Needles do
  context '#sizes' do
    before do
      stub_needles_sizes
    end

    it 'should return an array of needles' do
      result = Ravelry::Needles.sizes
      expect(result.first).to be_instance_of(Ravelry::Needle)
    end
  end

  context '#types' do
    before do
      stub_needles_types
    end

    it 'should return an array of needles' do
      result = Ravelry::Needles.types
      expect(result.first).to be_instance_of(Ravelry::Needle)
    end
  end

  context '#list' do
    before do
      stub_needles_list
    end

    it 'should return an array of needles' do
      result = Ravelry::Needles.list("feministy")
      expect(result.first).to be_instance_of(Ravelry::Needle)
    end
  end
end
