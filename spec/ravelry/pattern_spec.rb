require_relative '../spec_helper'

describe Ravelry::Pattern do

  it 'should be an instance of Patterns' do
      pattern = p_initialize_paid_with_fetch
      expect(pattern).to be_instance_of(Ravelry::Pattern)
  end

  context '#fetch_and_parse' do
    before do
      @api = p_initialize_paid_with_fetch
    end

    it 'should succeed' do
      expect(@api).to be
    end

    it 'should return a pattern' do
      expect(@api.data).to be
    end

    it 'should return a hash' do
      expect(@api.data).to be_kind_of(Hash)
    end
  end

  context 'class methods' do
    before do
      @api = p_initialize_with_data
      @data = paid_pattern_stub
    end

    describe 'pattern data attributes' do
      it 'comments_count' do
        expect(@api.comments_count).to eq(4)
      end

      it 'comments_count (Integer)' do
        expect(@api.comments_count).to be_kind_of(Integer)
      end

      it 'craft_name' do
        expect(@api.craft_name).to eq(@data[:craft][:name])
      end 

      it 'craft_permalink' do
        expect(@api.craft_permalink).to eq(@data[:craft][:permalink])
      end

      it 'currency' do
        expect(@api.currency).to eq(@data[:currency])
      end

      it 'currency_symbol' do
        expect(@api.currency_symbol).to eq(@data[:currency_symbol])
      end

      it 'difficulty_average_float (Float)' do
        expect(@api.difficulty_average_float).to be_kind_of(Float)
      end

      it 'difficulty_average_float' do
        expect(@api.difficulty_average_float).to eq(@data[:difficulty_average])
      end

      it 'difficulty_average_integer (Integer)' do
        expect(@api.difficulty_average_integer).to be_kind_of(Integer)
      end

      it 'difficulty_average_integer' do
        expect(@api.difficulty_average_integer).to eq(@data[:difficulty_average].round(0))
      end

      it 'difficulty_count (Integer)' do
        expect(@api.difficulty_count).to be_kind_of(Integer)
      end

      it 'difficulty_count' do
        expect(@api.difficulty_count).to eq(@data[:difficulty_count])
      end

      it 'downloadable?' do
        # testing data is true
        expect(@api.downloadable?).to be_true
      end

      it 'favorites_count (Integer)' do
        expect(@api.favorites_count).to be_kind_of(Integer)
      end

      it 'favorites_count' do
        expect(@api.favorites_count).to eq(@data[:favorites_count])
      end

      it 'free?' do
        # testing data is false
        expect(@api.free?).to be_false
      end

      it 'gauge' do
        expect(@api.gauge).to eq(@data[:gauge])
      end 

      it 'gauge (Float)' do
        expect(@api.gauge).to be_kind_of(Float)
      end

      it 'gauge_description' do
        expect(@api.gauge_description).to eq(@data[:gauge_description])
      end

      it 'gauge_divisor' do
        expect(@api.gauge_divisor).to eq(@data[:gauge_divisor])
      end

      it 'gauge_divisor (Integer)' do
        expect(@api.gauge_divisor).to be_kind_of(Integer)
      end

      it 'gauge_pattern' do
        expect(@api.gauge_pattern).to eq(@data[:gauge_pattern])
      end

      it 'notes_raw' do
        expect(@api.notes_raw).to eq(@data[:notes])
      end

      it 'notes_html' do
        expect(@api.notes_html).to eq(@data[:notes_html])
      end

      it 'packs_raw' do
        expect(@api.packs_raw).to eq(@data[:packs])
      end

      it 'packs_raw (Array)' do
        expect(@api.packs_raw).to be_kind_of(Array)
      end

      it 'packs_raw[0] (Hash)' do
        expect(@api.packs_raw[0]).to be_kind_of(Hash)
      end

      it 'pack_count' do
        expect(@api.pack_count).to eq(@data[:packs].length)
      end

      it 'pack_count (Integer)' do
        expect(@api.pack_count).to be_kind_of(Integer)
      end
    end

    # Associated objects
    describe 'associated objects #build_all_objects' do
      before do
        @api.build_all_objects
      end

      it 'should build author' do
        expect(@api.author).to be
      end

      it 'should build packs' do
        expect(@api.packs.length).to be > 0
      end

      it 'should build yarns' do
        expect(@api.yarns.length).to be > 0
      end

      it 'should build yarn weights' do
        expect(@api.yarn_weights.length).to be > 0
      end
    end

    describe 'associated objects #build_author' do
      before do
        @api.build_authors
      end

      it 'should exist' do
        expect(@api.author).to be
      end

      it 'should be an instance of Author' do
        expect(@api.author).to be_instance_of(Ravelry::Author)
      end
    end

    describe 'associated objects #build_yarns' do
      before do
        @api.build_yarns
      end

      it 'should exist' do
        expect(@api.yarns).to be
      end

      it 'should contain at least one' do
        expect(@api.yarns.length).to be > 0
      end

      it 'should be an instance of Yarn' do
        expect(@api.yarns[0]).to be_instance_of(Ravelry::Yarn)
      end
    end

    describe 'associated objects #build_yarn_weights' do
      before do
        @api.build_yarn_weights
      end

      it 'should exist' do
        expect(@api.yarn_weights).to be
      end

      it 'should contain at least one' do
        expect(@api.yarn_weights.length).to be > 0
      end

      it 'should be an instance of YarnWeight' do
        expect(@api.yarn_weights[0]).to be_instance_of(Ravelry::YarnWeight)
      end
    end

    describe 'associated objects #build_packs' do
      before do
        @api.build_packs
      end

      it 'should exist' do
        expect(@api.packs).to be
      end

      it 'should contain at least one' do
        expect(@api.packs.length).to be > 0
      end

      it 'should be an instance of Pack' do
        expect(@api.packs[0]).to be_instance_of(Ravelry::Pack)
      end
    end
  end
end