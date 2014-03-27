require_relative '../spec_helper'

describe Ravelry::Craft do
  before do
    @craft = Ravelry::Craft.new(craft)
    @data = craft
  end

  it 'creates an instance of Craft' do
    expect(@craft).to be_instance_of(Ravelry::Craft)
  end

  context 'has and sets reader attributes for' do
    it 'name' do
      expect(@craft.name).to eq(@data[:name])
    end

    it 'permalink' do
      expect(@craft.permalink).to eq(@data[:permalink])
    end
  end
end