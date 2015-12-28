module Ravelry

  # Utility module that takes the JSON response from the API call and creates the appropriate objects.
  #
  module Build

    # Creates and returns a {Ravelry::Author} object.
    #
    # See {Ravelry::Author} for more information.
    #
    def self.author(data)
      if data[:pattern_author]
        @author = Author.new(data[:pattern_author])
      else
        @author = nil
      end
    end

    # Creates and returns an array of {Ravelry::Category} objects.
    #
    # See {Ravelry::Category} for more information.
    #
    def self.categories(data)
      @categories = data.fetch(:pattern_categories, []).map do |cat|
        Category.new(cat)
      end
    end

    # Creates and returns a {Ravelry::Craft} object.
    #
    # See {Ravelry::Craft} for more information.
    #
    def self.craft(data)
      if data[:craft]
        @craft = Craft.new(data[:craft])
      else
        @craft = nil
      end
    end

    # Creates and returns an array of {Ravelry::Needle} objects.
    #
    # There is more than one API endpoint for Needles. This may not be the one you are looking for.
    #
    # See {Ravelry::Needle} for more information.
    #
    def self.needles(data)
      @needles = data.fetch(:pattern_needle_sizes, []).map do |ndl|
        Needle.new(ndl)
      end
    end

    # Creates and returns an array of {Ravelry::Pack} objects.
    #
    # See {Ravelry::Pack} for more information.
    #
    def self.packs(data)
      @packs = data.fetch(:packs, []).map do |pack_data|
        pack = Pack.new
        pack.data = pack_data
        pack
      end
    end

    # Creates and returns a {Ravelry::PatternType} object.
    #
    # This is not the same as a PatternCategory object.
    #
    # See {Ravelry::PatternType} for more information.
    #
    def self.pattern_type(data)
      if data[:pattern_type]
        @pattern_type = PatternType.new(data[:pattern_type])
      else
        @pattern_type = nil
      end
    end

    # Creates and returns an array of {Ravelry::Photo} objects.
    #
    # See {Ravelry::Photo} for more information.
    #
    def self.photos(data)
      @photos = data.fetch(:photos, []).map do |photo_data|
        photo = Photo.new(photo_data[:id])
        photo.data = photo_data
        photo
      end
    end

    # Creates and returns an array of {Ravelry::Printing} objects.
    #
    # See {Ravelry::Printing} for more information.
    #
    def self.printings(data)
      @printings = data.fetch(:printings, []).map do |printing_data|
        Printing.new(printing_data)
      end
    end

    # Creates and returns an array of {Ravelry::UserSite} objects.
    #
    # See {Ravelry::UserSite} for more information.
    #
    def self.user_sites(data)
      @user_sites = data.fetch(:user_sites, []).map do |site|
        UserSite.new(site)
      end
    end

    # Creates and returns an array of {Ravelry::Yarn} objects.
    #
    # See {Ravelry::Yarn} for more information.
    #
    def self.yarns(data)
      packs = data.fetch(:packs, []).select { |pack| pack[:yarn] }

      @yarns = packs.map do |pack|
        yarn = Yarn.new
        yarn.data = pack[:yarn]
        yarn
      end
    end

    # Creates and returns an array of {Ravelry::YarnWeight} objects.
    #
    # See {Ravelry::YarnWeight} for more information.
    #
    def self.yarn_weights(data)
      packs = data.fetch(:packs, []).select { |pack| pack[:yarn_weight] }

      @yarn_weights = packs.map do |pack|
        yarn_weight = YarnWeight.new
        yarn_weight.data = pack[:yarn_weight]
        yarn_weight
      end
    end

  end
end
