require_relative '../spec_helper'

describe Ravelry::Needle do
  before do
    @ndl = Ravelry::Needle.new(needle)
    @data = needle
  end

  it 'creates an instance of Needle' do
    expect(@ndl).to be_instance_of(Ravelry::Needle)
  end

  context 'has and sets reader attributes for' do
    it 'hook' do
      expect(@ndl.hook).to eq(@data[:hook])
    end

    it 'us' do
      expect(@ndl.us).to eq(@data[:us])
    end

    it 'metric' do
      expect(@ndl.metric).to eq(@data[:metric])
    end
  end

  context 'class methods' do
    it '#type returns crochet' do
      ndl = { :hook=>"E", :us_steel=>"00", :name=>"US 4  - 3.5 mm",
      :crochet=>true, :metric=>3.5, :knitting=>false, :us=>"4 ",
      :id=>4 }
      needle = Ravelry::Needle.new(ndl)
      expect(needle.type).to eq('crochet')
    end

    it '#us_string' do
      expect(@ndl.us_string).to eq('US 4')
    end

    it '#metric_string' do
      expect(@ndl.metric_string).to eq('3.5 mm')
    end
  end
end