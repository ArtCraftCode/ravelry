require_relative '../spec_helper'

describe Ravelry::Yarn do
  it 'creates an instance of Yarn' do
    yarn = y_initialize_with_data_and_id
    expect(yarn).to be_instance_of(Ravelry::Yarn)
  end

  context 'has and sets reader attributes for' do
    before do
      @yarn = y_initialize_with_data
    end

    it 'permalink' do
      expect(@yarn.permalink).to eq(yarn_hash[:permalink])
    end

    it 'company' do
      expect(@yarn.company).to eq(yarn_hash[:yarn_company_name])
    end

    it 'name' do
      expect(@yarn.name).to eq(yarn_hash[:name])
    end

    it 'company_id' do
      expect(@yarn.company_id).to eq(yarn_hash[:yarn_company_id])
    end
  end
end