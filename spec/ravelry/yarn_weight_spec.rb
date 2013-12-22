require_relative '../spec_helper'

describe Ravelry::YarnWeight do
  it 'creates an instance of YarnWeight' do
    yarn_weight = yw_initialize_with_data_and_id
    expect(yarn_weight).to be_instance_of(Ravelry::YarnWeight)
  end

  context 'has and sets reader attributes for' do
    before do
      @yarn_weight = yw_initialize_with_data
    end

    it 'name' do
      expect(@yarn_weight.name).to eq(yarn_weight_hash[:name])
    end

    it 'min_gauge' do
      expect(@yarn_weight.min_gauge).to eq(yarn_weight_hash[:min_gauge])
    end

    it 'wpi' do
      expect(@yarn_weight.wpi).to eq(yarn_weight_hash[:wpi])
    end

    it 'crochet_gauge' do
      expect(@yarn_weight.crochet_gauge).to eq(yarn_weight_hash[:crochet_gauge])
    end

    it 'ply' do
      expect(@yarn_weight.ply).to eq(yarn_weight_hash[:ply])
    end

    it 'knit_gauge' do
      expect(@yarn_weight.knit_gauge).to eq(yarn_weight_hash[:knit_gauge])
    end

    it 'max_gauge' do
      expect(@yarn_weight.max_gauge).to eq(yarn_weight_hash[:max_gauge])
    end
  end
end