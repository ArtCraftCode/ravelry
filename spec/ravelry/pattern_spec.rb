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

      it 'pattern_author' do
        expect(@api.pattern_author).to eq(@data[:pattern_author])
      end

      it 'pattern_categories_raw' do
        expect(@api.pattern_categories_raw).to eq(@data[:pattern_categories])
      end

      it 'pattern_needle_sizes_raw' do
        expect(@api.pattern_needle_sizes_raw).to eq(@data[:pattern_needle_sizes])
      end

      it 'pattern_type_raw' do
        expect(@api.pattern_type_raw).to eq(@data[:pattern_type])
      end

      it 'pdf_url' do
        expect(@api.pdf_url).to eq(@data[:pdf_url])
      end

      it 'permalink' do
        expect(@api.permalink).to eq(@data[:permalink])
      end

      it 'photos_raw' do
        expect(@api.photos_raw).to eq(@data[:photos])
      end

      it 'price' do
        expect(@api.price).to eq(@data[:price])
      end

      it 'printings' do
        expect(@api.printings).to eq(@data[:printings])
      end

      it 'product_id' do
        expect(@api.product_id).to eq(@data[:product_id])
      end

      it 'projects_count' do
        expect(@api.projects_count).to eq(@data[:projects_count])
      end

      it 'projects_count (Integer)' do
        expect(@api.projects_count).to be_kind_of(Integer)
      end

      it 'published' do
        expect(@api.published).to eq(@data[:published])
      end

      it 'queued_projects_count' do
        expect(@api.queued_projects_count).to eq(@data[:queued_projects_count])
      end

      it 'rating_average' do
        expect(@api.rating_average).to eq(@data[:rating_average])
      end

      it 'rating_count' do
        expect(@api.rating_count).to eq(@data[:rating_count])
      end

      it 'ravelry_download?' do
        expect(@api.ravelry_download?).to eq(@data[:ravelry_download])
      end

      it 'row_gauge' do
        expect(@api.row_gauge).to eq(@data[:row_gauge])
      end

      it 'sizes_available' do
        expect(@api.sizes_available).to eq(@data[:sizes_available])
      end

      it 'url' do
        expect(@api.url).to eq(@data[:url])
      end

      it 'yardage' do
        expect(@api.yardage).to eq(@data[:yardage])
      end

      it 'yardage_description' do
        expect(@api.yardage_description).to eq(@data[:yardage_description])
      end

      it 'yardage_max' do
        expect(@api.yardage_max).to eq(@data[:yardage_max])
      end

      it 'yarn_weight' do
        expect(@api.yarn_weight).to eq(@data[:yarn_weight])
      end

      it 'yarn_weight_description' do
        expect(@api.yarn_weight_description).to eq(@data[:yarn_weight_description])
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

      it 'should build categories' do
        expect(@api.categories.length).to be > 0
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

    describe 'associated objects #build_categories' do
      before do
        @api.build_categories
      end

      it 'should exist' do
        expect(@api.categories).to be
      end

      it 'should contain at least one' do
        expect(@api.categories.length).to be > 0
      end

      it 'should be an instance of Category' do
        expect(@api.categories[0]).to be_instance_of(Ravelry::Category)
      end
    end

    # TODO
    # Currently failing

    # describe 'associated objects #build_craft' do
    #   before do
    #     @api.build_craft
    #   end

    #   it 'should exist' do
    #     expect(@api.craft).to be
    #   end

    #   it 'should be an instance of Craft' do
    #     expect(@api.craft).to be_instance_of(Ravelry::Craft)
    #   end
    # end

    # describe 'associated objects #build_needles' do
    #   before do
    #     @api.build_needles
    #   end

    #   it 'should exist' do
    #     expect(@api.needles).to be
    #   end

    #   it 'should contain at least one' do
    #     expect(@api.needles.length).to be > 0
    #   end

    #   it 'should be an instance of Needle' do
    #     expect(@api.needles[0]).to be_instance_of(Ravelry::Needle)
    #   end
    # end

    # describe 'associated objects #build_photos' do
    #   before do
    #     @api.build_photos
    #   end

    #   it 'should exist' do
    #     expect(@api.photos).to be
    #   end

    #   it 'should contain at least one' do
    #     expect(@api.photos.length).to be > 0
    #   end

    #   it 'should be an instance of Photo' do
    #     expect(@api.photos[0]).to be_instance_of(Ravelry::Photo)
    #   end
    # end

    # describe 'associated objects #build_printings' do
    #   before do
    #     @api.build_printings
    #   end

    #   it 'should exist' do
    #     expect(@api.printings).to be
    #   end

    #   it 'should contain at least one' do
    #     expect(@api.printings.length).to be > 0
    #   end

    #   it 'should be an instance of Pack' do
    #     expect(@api.printings[0]).to be_instance_of(Ravelry::Printing)
    #   end
    # end

    # describe 'associated objects #build_type' do
    #   before do
    #     @api.build_type
    #   end

    #   it 'should exist' do
    #     expect(@api.type).to be
    #   end

    #   it 'should be an instance of Pack' do
    #     expect(@api.type).to be_instance_of(Ravelry::Type)
    #   end
    # end
  end
end