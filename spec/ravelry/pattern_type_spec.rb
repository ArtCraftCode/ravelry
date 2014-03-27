require_relative '../spec_helper'

describe Ravelry::PatternType do
  before do
    @type = Ravelry::PatternType.new(pattern_type)
    @data = pattern_type
  end

  it 'creates an instance of PatternType' do
    expect(@type).to be_instance_of(Ravelry::PatternType)
  end

  context 'has and sets reader attributes for' do
    it '#permalink' do
      expect(@type.permalink).to eq(@data[:permalink])
    end

    it '#name' do
      expect(@type.name).to eq(@data[:name])
    end
  end

  context 'class methods' do
    it '#clothing?' do
      expect(@type.clothing?).to eq(@data[:clothing])
    end
  end
end