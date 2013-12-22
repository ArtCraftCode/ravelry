require_relative '../spec_helper'

describe Ravelry::Data do
  # testing using Ravelry::Yarn
  context '#fetch_api?' do
    it 'returns true if passed id, no data' do
      yarn = y_initialize_empty_yarn
      yarn.id = "1234"
      expect(yarn.send(:fetch_api?)).to be_true
    end

    it 'returns false if passed id, data' do
      yarn = y_initialize_with_data_and_id
      expect(yarn.send(:fetch_api?)).to be_false
    end

    it 'returns false if passed no id, no data' do
      yarn = y_initialize_empty_yarn
      expect(yarn.send(:fetch_api?)).to be_false
    end

    it 'returns false if passed no id, data' do
      yarn = y_initialize_empty_yarn
      expect(yarn.send(:fetch_api?)).to be_false
    end
  end
end