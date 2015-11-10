module Ravelry

  # Utility module that takes the JSON response from the API call and creates the appropriate objects.
  #
  module Build

    # Creates and returns a {Ravelry::Author} object.
    #
    # See {Ravelry::Author} for more information.
    #
    def self.author(data)
      @author = Author.new(data[:pattern_author])
    end

    # Creates and returns an array of {Ravelry::Category} objects.
    #
    # See {Ravelry::Category} for more information.
    #
    def self.categories(data)
      @categories = []
      data[:pattern_categories].each do |cat|
        @categories << Category.new(cat)
      end
      @categories
    end

    # Creates and returns a {Ravelry::Craft} object.
    #
    # See {Ravelry::Craft} for more information.
    #
    def self.craft(data)
      @craft = Craft.new(data[:craft])
    end

    # Creates and returns an array of {Ravelry::PatternNeedle} objects.
    #
    # There is more than one API endpoint for Needles. This may not be the one you are looking for.
    #
    # See {Ravelry::PatternNeedle} for more information.
    #
    def self.needles(data)
      @needles = []
      data[:pattern_needle_sizes].each do |ndl|
        @needles << PatternNeedle.new(ndl)
      end
      @needles
    end

    # Creates and returns an array of {Ravelry::Pack} objects.
    #
    # See {Ravelry::Pack} for more information.
    #
    def self.packs(data)
      @packs = []
      data[:packs].each do |pack_data|
        pack = Pack.new
        pack.data = pack_data
        @packs << pack
      end
      @packs
    end

    # Creates and returns a {Ravelry::PatternType} object.
    #
    # This is not the same as a PatternCategory object.
    #
    # See {Ravelry::PatternType} for more information.
    #
    def self.pattern_type(data)
      @pattern_type = PatternType.new(data[:pattern_type])
    end

    # Creates and returns an array of {Ravelry::Photo} objects.
    #
    # See {Ravelry::Photo} for more information.
    #
    def self.photos(data)
      @photos = []
      data[:photos].each do |photo_data|
        photo = Photo.new(photo_data[:id])
        photo.data = photo_data
        @photos << photo
      end
      @photos
    end

    # Creates and returns an array of {Ravelry::Printing} objects.
    #
    # See {Ravelry::Printing} for more information.
    #
    def self.printings(data)
      @printings = []
      data[:printings].each do |printing_data|
        @printings << Printing.new(printing_data)
      end
      @printings
    end

    # Creates and returns an array of {Ravelry::UserSite} objects.
    #
    # See {Ravelry::UserSite} for more information.
    #
    def self.user_sites(data)
      @user_sites = []
      data[:user_sites].each do |site|
        @user_sites << UserSite.new(site)
      end
      @user_sites
    end

    # Creates and returns an array of {Ravelry::Yarn} objects.
    #
    # See {Ravelry::Yarn} for more information.
    #
    def self.yarns(data)
      @yarns = []
      data[:packs].each do |pack_data|
        yarn = Yarn.new
        yarn.data = pack_data[:yarn]
        @yarns << yarn
      end
      @yarns
    end

    # Creates and returns an array of {Ravelry::YarnWeight} objects.
    #
    # See {Ravelry::YarnWeight} for more information.
    #
    def self.yarn_weights(data)
      @yarn_weights = []
      data[:packs].each do |pack|
        yarn_weight = YarnWeight.new
        yarn_weight.data = pack[:yarn_weight]
        @yarn_weights << yarn_weight
      end
      @yarn_weights
    end

  end
end
