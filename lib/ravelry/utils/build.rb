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

    def self.craft(data)
      @craft = nil
    end

    def self.needles(data)
      @needles = []
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

    def self.photos(data)
      @photos = []
    end

    def self.printings(data)
      @printings = []
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
