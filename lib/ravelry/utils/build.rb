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
      data[:packs].each do |pack|
        @packs << Pack.new(nil, pack)
      end
      @packs
    end

    # Creates and returns an array of {Ravelry::Photo} objects.
    #
    # See {Ravelry::Photo} for more information.
    #
    def self.photos(data)
      @photos = []
      data[:photos].each do |photo|
        @photos << Photo.new(photo[:id], photo)
      end
      @photos
    end

    # Creates and returns an array of {Ravelry::Printing} objects.
    #
    # See {Ravelry::Printing} for more information.
    #
    def self.printings(data)
      @printings = []
      data[:printings].each do |printing|
        @printings << Printing.new(printing)
      end
      @printings
    end

    def self.type(data)
      @type = nil
    end

    # Creates and returns an array of {Ravelry::Yarn} objects.
    #
    # See {Ravelry::Yarn} for more information.
    #
    def self.yarns(data)
      @yarns = []
      data[:packs].each do |pack|
        @yarns << Yarn.new(nil, pack[:yarn])
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
        @yarn_weights << YarnWeight.new(nil, pack[:yarn_weight])
      end
      @yarn_weights
    end

  end
end
