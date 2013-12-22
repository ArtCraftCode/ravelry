require_relative '../spec_helper'

describe Ravelry::Category do
  before do
    @category = Ravelry::Category.new(categories)
    @data = categories
  end

  it 'creates an instance of Category' do
    expect(@category).to be_instance_of(Ravelry::Category)
  end

  context 'has and sets reader attributes for' do
    it 'name' do
      expect(@category.name).to eq(@data[:name])
    end

    it 'permalink' do
      expect(@category.permalink).to eq(@data[:permalink])
    end

    it 'parent_name' do
      expect(@category.parent_name).to eq(@data[:parent][:name])
    end

    it 'parent_permalink' do
      expect(@category.parent_permalink).to eq(@data[:parent][:permalink])
    end

    it 'grandparent_name' do
      expect(@category.grandparent_name).to eq(@data[:parent][:parent][:name])
    end

    it 'grandparent_permalink' do
      expect(@category.grandparent_permalink).to eq(@data[:parent][:parent][:permalink])
    end

    it 'greatgrandparent_name' do
      expect(@category.greatgrandparent_name).to eq(@data[:parent][:parent][:parent][:name])
    end

    it 'greatgrandparent_permalink' do
      expect(@category.greatgrandparent_permalink).to eq(@data[:parent][:parent][:parent][:permalink])
    end
  end
end