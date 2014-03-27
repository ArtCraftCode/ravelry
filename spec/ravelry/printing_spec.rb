require_relative '../spec_helper'

describe Ravelry::Printing do
  before do
    @printing = Ravelry::Printing.new(printing.first)
    @data = printing[0][:pattern_source]
    @primary_source = printing[0][:primary_source]
  end

  it 'creates an instance of Printing' do
    expect(@printing).to be_instance_of(Ravelry::Printing)
  end

  context 'has and sets reader attributes for' do
    it '#price' do
      expect(@printing.price).to eq(@data[:price])
    end

    it '#permalink' do
      expect(@printing.permalink).to eq(@data[:permalink])
    end

    it '#name' do
      expect(@printing.name).to eq(@data[:name])
    end

    it '#author' do
      expect(@printing.author).to eq(@data[:author])
    end

    it '#url' do
      expect(@printing.url).to eq(@data[:url])
    end

    it '#amazon_rating' do
      expect(@printing.amazon_rating).to eq(@data[:amazon_rating])
    end

    it '#pattern_count' do
      expect(@printing.pattern_count).to eq(@data[:pattern_count])
    end

    it '#amazon_url' do
      expect(@printing.amazon_url).to eq(@data[:amazon_url])
    end

    it '#shelf_image_path' do
      expect(@printing.shelf_image_path).to eq(@data[:shelf_image_path])
    end

    it '#list_price' do
      expect(@printing.list_price).to eq(@data[:list_price])
    end
  end

  context 'class methods' do
    it '#out_of_print?' do
      expect(@printing.out_of_print?).to eq(@data[:out_of_print])
    end

    it '#primary_source?' do
      expect(@printing.primary_source?).to eq(@primary_source)
    end
  end
end