require_relative '../spec_helper'

describe Ravelry::Yarn do
  it 'creates an instance of Yarn' do
    yarn = initialze_with_data_and_id
    expect(yarn).to be_instance_of(Ravelry::Yarn)
  end

  context 'has and sets reader attributes for' do
    before do
      @yarn = initialize_with_data
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

  context '#fetch_api?' do
    it 'returns true if passed id, no data' do
      yarn = initialize_empty_yarn
      yarn.id = "1234"
      expect(yarn.send(:fetch_api?)).to be_true
    end

    it 'returns false if passed id, data' do
      yarn = initialze_with_data_and_id
      expect(yarn.send(:fetch_api?)).to be_false
    end

    it 'returns false if passed no id, no data' do
      yarn = initialize_empty_yarn
      expect(yarn.send(:fetch_api?)).to be_false
    end

    it 'returns false if passed no id, data' do
      yarn = initialize_empty_yarn
      expect(yarn.send(:fetch_api?)).to be_false
    end
  end
end