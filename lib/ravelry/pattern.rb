module Ravelry

  # `Ravelry::Pattern` corresponds to Pattern objects in Ravelry.
  #
  # The `Pattern` object can be passed an id as an integer or a string. See {file:README.md README} for information on accessing pattern IDs.
  #
  # This class requires your environment variables be set (see {file:README.md README}). API calls are authenticated using HTTP Basic Auth unless otherwise noted.
  #
  # If your `pattern.data` is missing one of the attributes below, that method will return `nil`.
  #
  # # `GET` Request
  #
  # Initializing the class with an id will automatically trigger an API call using your access key and personal key.
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new("000000")
  # ```
  #
  # After the call is complete, you have access to all of the pattern attributes through the class methods (see documentation). Example:
  #
  # ```ruby
  # pattern.free?
  # # => true
  # ```
  #
  # #Initialization without a pattern id
  #
  # If you don't want to perform a `GET` request right out of the gate, simply initialize with no arguments.
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new
  # ```
  #
  # To complete the `GET` request, set the `id` and run:
  #
  # ```ruby
  # pattern.id = "000000"
  # pattern.get
  # ```
  #
  # After calling `get`, you have access to all of the class methods below.
  #
  # #Initialization with existing pattern data
  #
  # If you have existing pattern data, you should initialize as follows:
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new(nil, my_data)
  # ```
  #
  # You now have access to all class methods for your pattern. Be warned: if you run `get` again, you will override your data with fresh information from the API call.
  #
  # # Building associated objects
  #
  # You will need to call special methods to create the associated objects with your pattern.
  #
  # To create all associated objects at once, call the following method after initialization:
  #
  # ```ruby
  # pattern.build_all_objects
  # ```
  #
  # Note that this does not perform an API call: it creates the objects using the data returned from the initial `get` for your pattern object.
  #
  # This will create the following objects and readers from the existing `data`:
  #
  # * `pattern.author` - a {Ravelry::Author} object
  # * `pattern.categories` - an array of {Ravelry::Category} objects
  # * `pattern.craft` - a {Ravelry::Craft} object
  # * `pattern.needles` - an array of {Ravelry::PatternNeedle} objects
  # * `pattern.packs` - array of {Ravelry::Pack} objects
  # * `pattern.photos` - an array of {Ravelry::Photo} objects
  # * `pattern.printings` - an array of {Raverly::Printing} objects
  # * `pattern.type` - a {Ravelry::PatternType} object
  # * `pattern.yarns` - array of {Ravelry::Yarn} objects
  # * `pattern.yarn_weights` - array of {Ravelry::YarnWeight} objects
  #
  # See the documentation for each object's available methods.
  #
  class Pattern < Data

    include Build

    attr_reader :author, :categories, :craft, :needles, :packs, :photos, :printings, :type, :yarns, :yarn_weights

    # Handles GET API call and parses JSON response.
    #
    def get
      c = Curl::Easy.new("https://api.ravelry.com/patterns/#{@id}.json")
      c.http_auth_types = :basic
      c.username = ENV['RAV_ACCESS']
      c.password = ENV['RAV_PERSONAL']
      c.perform
      result = JSON.parse(c.body_str, {symbolize_names: true})
      @data = result[:pattern]
    end

    # Creates all objects associated with your pattern; returns nothing; sets `attr_readers`.
    #
    def build
      @author = Build.author(data)
      @categories = Build.categories(data)
      @craft = Build.craft(data)
      @needles = Build.needles(data)
      @packs = Build.packs(data)
      @photos = Build.photos(data)
      @printings = Build.printings(data)
      @type = Build.pattern_type(data)
      @yarns = Build.yarns(data)
      @yarn_weights = Build.yarn_weights(data)
      nil
    end

    # Gets comments_count from existing `data`.
    #
    def comments_count
      data[:comments_count]
    end

    # Gets currency from existing `data`.
    #
    def currency
      data[:currency]
    end

    # Gets currency_symbol from existing `data`.
    #
    def currency_symbol
      data[:currency_symbol]
    end

    # Returns the difficult average as a Float (this is how it is stored by Ravelry).
    #
    def difficulty_average_float
      data[:difficulty_average]
    end

    # Returns the difficulty average rounded up or down to an Integer.
    #
    def difficulty_average_integer
      difficulty_average_float.round(0)
    end

    # Gets difficulty_count (Integer) from existing `data`.
    #
    def difficulty_count
      data[:difficulty_count]
    end

    # Returns true if the pattern can be downloaded.
    #
    def downloadable?
      data[:downloadable]
    end

    # Gets favorites_count (Integer) from existing `data`.
    #
    def favorites_count
      data[:favorites_count]
    end

    # Returns true if pattern is free (Boolean).
    #
    def free?
      data[:free]
    end

    # Number of stitches per inch (or 4 inches) (Float).
    #
    def gauge
      data[:gauge]
    end

    # Sentence description of sts and row gauge with stitch.
    #
    def gauge_description
      data[:gauge_description]
    end

    # Either 1 or 4 (inches) (Integer).
    #
    def gauge_divisor
      data[:gauge_divisor]
    end

    # Pattern for gauge listed.
    #
    def gauge_pattern
      data[:gauge_pattern]
    end

    # Gets patter name from existing `data`.
    #
    def name
      data[:name]
    end

    # Raw pattern notes. May be mixed Markdown and HTML. Generally only useful when presenting a pattern notes editor.
    #
    def notes_raw
      data[:notes]
    end

    # Pattern notes rendered as HTML.
    #
    def notes_html
      data[:notes_html]
    end

    # Returns an array of hashes with tons of information about each yarn listed in the pattern. See {#build_packs} for a complete list of helper methods.
    #
    # I've included this method in case you want to have more control over how your pack information is displayed. It's likely that you'll want to use the other pack methods. While you sacrifice some fine tuning control, you also don't have to worry about dealing with a messy nested hash.
    #
    # If you're really determined to go through this manually, check out the [Ravelry documentation](http://www.ravelry.com/api#Pack_result).
    #
    # If iterating through the `packs` hash, you'll likely want to do something like this:
    #
    # `packs = pattern.packs`
    #
    # **`packs[0][:yarn_name]`** returns a formatted string with the brand and yarn name.
    #
    # *Example: "Wooly Wonka Fibers Artio Sock"*
    #
    def packs_raw
      data[:packs]
    end

    # Helper that will tell you how many yarns you have in your pack.
    #
    def pack_count
      data[:packs].length
    end

    # Returns a hash with information about the pattern author.
    #
    # I've included this method in case you want to have more control over how your author information is displayed.
    #
    # See {#build_authors} for more information about directly accessing author information.
    #
    def pattern_author
      data[:pattern_author]
    end

    # Returns an array of hashes with information about the categories.
    #
    # This method is included so you can access the information directly.
    #
    # See {#build_categories} for more information about directly accessing category information.
    #
    def pattern_categories_raw
      data[:pattern_categories]
    end

    def pattern_needle_sizes_raw
      data[:pattern_needle_sizes]
    end

    def pattern_type_raw
      data[:pattern_type]
    end

    # Gets pdf_url from existing `data`.
    #
    def pdf_url
      data[:pdf_url]
    end

    # Gets Ravelry permalink from existing `data`.
    #
    def permalink
      data[:permalink]
    end

    #
    def photos_raw
      data[:photos]
    end

    # Gets price from existing `data` (Float).
    #
    def price
      data[:price]
    end

    # Gets product_id from existing `data`.
    #
    def product_id
      data[:product_id]
    end

    # Gets projects_count from existing `data` (Integer).
    #
    def projects_count
      data[:projects_count]
    end

    def published
      data[:published]
      # TODO: Create formatted date method
      # Gets publication date from existing `data` (Date).
    end

    # Gets number of queued projects from existing `data` (Integer).
    #
    def queued_projects_count
      data[:queued_projects_count]
    end

    # Gets rating_average from existing `data` (Float).
    #
    def rating_average
      data[:rating_average]
    end

    # Gets number of ratings from existing `data` (Integer).
    #
    def rating_count
      data[:rating_count]
    end

    # Returns true if pattern is a Ravelry download (Boolean).
    #
    def ravelry_download?
      data[:ravelry_download]
    end

    # Gets row gauge from existing `data` (Float).
    #
    def row_gauge
      data[:row_gauge]
    end

    # Gets sizes available from existing `data`.
    #
    def sizes_available
      data[:sizes_available]
    end

    # Gets url from existing `data`.
    #
    def url
      data[:url]
    end

    # Gets yardage required from existing `data` (Integer).
    #
    def yardage
      data[:yardage]
    end

    # Gets nice sentence yardage description with range from existing `data`.
    #
    def yardage_description
      data[:yardage_description]
    end

    # Gets max yards required from existing `data` (Integer).
    #
    def yardage_max
      data[:yardage_max]
    end

    # Gets primary yarn weight description from existing `data`.
    #
    def yarn_weight_description
      data[:yarn_weight_description]
    end
  end
end