require_relative '../spec_helper'

describe Ravelry::Misc do
  context '#color_families' do
    it 'should return an array of color families' do
      result = Ravelry::Misc.color_families
      expect(result.first).to be_instance_of(Ravelry::ColorFamily)
    end
  end

  context '#yarn_weights' do
    it 'should return an array of color families' do
      result = Ravelry::Misc.yarn_weights
      expect(result.first).to be_instance_of(Ravelry::YarnWeight)
    end
  end
end