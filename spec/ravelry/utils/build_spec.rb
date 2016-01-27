require_relative '../../spec_helper'

describe Ravelry::Build do
  context 'author' do
    before do
      @author = Ravelry::Build.author(paid_pattern_stub)
    end

    it 'exists' do
      expect(@author).to be
    end

    it 'returns an instance of Author' do
      expect(@author).to be_instance_of(Ravelry::Author)
    end

    context 'without an author' do
      before do
        @author = Ravelry::Build.author({})
      end

      it 'returns nil' do
        expect(@author).to be(nil)
      end
    end
  end

  context '#categories' do
    before do
      @categories = Ravelry::Build.categories(paid_pattern_stub)
    end

    it 'exists' do
      expect(@categories).to be_true
    end

    it 'returns an array' do
      expect(@categories).to be_instance_of(Array)
    end

    it 'contains at least 1 item' do
      expect(@categories.length).to be > 0
    end

    it 'returns an array with Category objects' do
      expect(@categories[0]).to be_instance_of(Ravelry::Category)
    end

    context 'without categories' do
      before do
        @categories = Ravelry::Build.categories({})
      end

      it 'returns an empty array' do
        expect(@categories).to eql([])
      end
    end
  end

  context '#craft' do
    before do
      @craft = Ravelry::Build.craft(paid_pattern_stub)
    end

    it 'exists' do
      expect(@craft).to be_true
    end

    it 'returns an instance of Craft' do
      expect(@craft).to be_instance_of(Ravelry::Craft)
    end

    context 'without a craft' do
      before do
        @craft = Ravelry::Build.craft({})
      end

      it 'returns nil' do
        expect(@craft).to be(nil)
      end
    end
  end

  context '#needles' do
    before do
      @needles = Ravelry::Build.needles(paid_pattern_stub)
    end

    it 'exists' do
      expect(@needles).to be_true
    end

    it 'returns an Array' do
      expect(@needles).to be_instance_of(Array)
    end

    it 'returns an Array of Needle objects' do
      expect(@needles[0]).to be_instance_of(Ravelry::Needle)
    end

    context 'without needles' do
      before do
        @needles = Ravelry::Build.needles({})
      end

      it 'returns an empty array' do
        expect(@needles).to eql([])
      end
    end
  end

  context '#packs' do
    before do
      @packs = Ravelry::Build.packs(paid_pattern_stub)
    end

    it 'exists' do
      expect(@packs).to be_true
    end

    it 'returns an Array' do
      expect(@packs).to be_instance_of(Array)
    end

    it 'contains at least 1' do
      expect(@packs.length).to be > 0
    end

    it 'returns an Array of Pack objects' do
      expect(@packs[0]).to be_instance_of(Ravelry::Pack)
    end

    context 'without packs' do
      before do
        @packs = Ravelry::Build.packs({})
      end

      it 'returns an empty array' do
        expect(@packs).to eql([])
      end
    end
  end

  context '#pattern_type' do
    before do
      @type = Ravelry::Build.pattern_type(paid_pattern_stub)
    end

    it 'exists' do
      expect(@type).to be_true
    end

    it 'returns an instance of Type' do
      expect(@type).to be_instance_of(Ravelry::PatternType)
    end

    context 'without a type' do
      before do
        @type = Ravelry::Build.pattern_type({})
      end

      it 'returns nil' do
        expect(@type).to be(nil)
      end
    end
  end

  context '#photos' do
    before do
      @photos = Ravelry::Build.photos(paid_pattern_stub)
    end

    it 'exists' do
      expect(@photos).to be_true
    end

    it 'returns an Array' do
      expect(@photos).to be_instance_of(Array)
    end

    it 'returns an array of Photo objects' do
      expect(@photos[0]).to be_instance_of(Ravelry::Photo)
    end

    context 'without photos' do
      before do
        @photos = Ravelry::Build.photos({})
      end

      it 'returns an empty array' do
        expect(@photos).to eql([])
      end
    end
  end

  context '#printings' do
    before do
      @printings = Ravelry::Build.printings(paid_pattern_stub)
    end

    it 'exists' do
      expect(@printings).to be_true
    end

    it 'returns an array' do
      expect(@printings).to be_instance_of(Array)
    end

    it 'returns an array with Printing objects' do
      expect(@printings[0]).to be_instance_of(Ravelry::Printing)
    end

    context 'without printings' do
      before do
        @printings = Ravelry::Build.printings({})
      end

      it 'returns an empty array' do
        expect(@printings).to eql([])
      end
    end
  end

  context '#user_sites' do
    context 'without user sites' do
      before do
        @user_sites = Ravelry::Build.user_sites({})
      end

      it 'returns an empty array' do
        expect(@user_sites).to eql([])
      end
    end
  end

  context '#yarns' do
    before do
      @yarns = Ravelry::Build.yarns(paid_pattern_stub)
    end

    it 'exists' do
      expect(@yarns).to be_true
    end

    it 'returns an array' do
      expect(@yarns).to be_instance_of(Array)
    end

    it 'contains at least 1' do
      expect(@yarns.length).to be > 0
    end

    it 'returns an array of Yarn objects' do
      expect(@yarns[0]).to be_instance_of(Ravelry::Yarn)
    end

    context 'without yarns' do
      before do
        @yarns = Ravelry::Build.yarns({})
      end

      it 'returns an empty array' do
        expect(@yarns).to eql([])
      end
    end
  end

  context '#yarn_weights' do
    before do
      @yw = Ravelry::Build.yarn_weights(paid_pattern_stub)
    end

    it 'exists' do
      expect(@yw).to be_true
    end

    it 'contains at least 1' do
      expect(@yw.length).to be > 0
    end

    it 'returns an array' do
      expect(@yw).to be_instance_of(Array)
    end

    it 'returns an array of YarnWeight objects' do
      expect(@yw[0]).to be_instance_of(Ravelry::YarnWeight)
    end

    context 'without yarn weights' do
      before do
        @yw = Ravelry::Build.yarn_weights({})
      end

      it 'returns an empty array' do
        expect(@yw).to eql([])
      end
    end
  end
end
