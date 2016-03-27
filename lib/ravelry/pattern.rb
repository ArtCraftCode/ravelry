module Ravelry

  # `Ravelry::Pattern` corresponds to Pattern objects in Ravelry.
  #
  # This class requires your configuration variables be set (see {file:README.md README}). API calls are authenticated using HTTP Basic Auth unless otherwise noted.
  #
  # If your `pattern.data` is missing one of the attributes below, that method will return `nil`.
  #
  # #Pattern objects
  #
  # To create an empty object:
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
  # If you do not have the pattern ID, you may use the permalink:
  #
  # Ravelry URL: http://www.ravelry.com/patterns/library/traveling-woman
  #
  # Request:
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new
  # pattern.permalink_get('traveling-woman')
  # ```
  #
  # ##Initializing with an id
  #
  # Optionally, you can initialize with an id:
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new(id)
  # ```
  #
  # And then run your get request:
  #
  # ```ruby
  # pattern.get
  # ```
  #
  # ##Loading existing pattern data
  #
  # If you have existing pattern data, you should initialize as follows:
  #
  # ```ruby
  # pattern = Ravelry::Pattern.new
  # pattern.data = my_data
  # ```
  #
  # You now have access to all class methods for your pattern. Be warned: if you run `get` again, you will override your data with fresh information from the API call.
  #
  # # Pattern data
  #
  # After you have pattern data from the API, you have access to all of the pattern attributes through the class methods (see documentation). Example:
  #
  # ```ruby
  # pattern.free?
  # # => true
  # ```
  #
  # # Building associated objects
  #
  # You will need to call special methods to create the associated objects with your pattern.
  #
  # To create all associated objects at once, call the following method after initialization:
  #
  # ```ruby
  # pattern.build
  # ```
  #
  # Note that this does not perform an API call: it creates the objects using the data returned from the initial `get` for your pattern object.
  #
  # This will create the following objects and readers from the existing `data`:
  #
  # * `pattern.author` - a {Ravelry::Author} object
  # * `pattern.categories` - an array of {Ravelry::Category} objects
  # * `pattern.craft` - a {Ravelry::Craft} object
  # * `pattern.needles` - an array of {Ravelry::Needle} objects
  # * `pattern.packs` - array of {Ravelry::Pack} objects
  # * `pattern.photos` - an array of {Ravelry::Photo} objects
  # * `pattern.printings` - an array of {Raverly::Printing} objects
  # * `pattern.type` - a {Ravelry::PatternType} object
  # * `pattern.yarns` - array of {Ravelry::Yarn} objects
  # * `pattern.yarn_weights` - array of {Ravelry::YarnWeight} objects
  #
  # See the documentation for each object's available methods.
  #
  # # Searching
  #
  # To search for patterns, use the `Pattern.search` class method, which
  # returns an array of patterns.
  #
  # @example
  #   Ravelry::Pattern.search('socks')
  #   # => [#<Pattern>, ...]
  #
  class Pattern < Data

    # Whitelist and default options for fetching comments.
    #
    COMMENT_OPTIONS = {
      sort: ['time', 'helpful', 'time_', 'helpful_'],
      page_size: 25,
      include: ['highlighted_project'],
      page: 1
    }

    include Build

    attr_reader :author, :categories, :craft, :needles, :packs, :photos, :printings, :type, :yarns, :yarn_weights

    # Handles GET API call and parses JSON response.
    #
    # Corresponds to Ravelry API endpoint `Patterns#show`
    #
    def get
      @data = Utils::Request.get("patterns/#{@id}.json", :pattern)
      self
    end

    # Alternative method for the GET API call.
    #
    # Corresponds to Ravelry API endpoint `Patterns#show`
    #
    # Uses the pattern's Ravelry permalink instead of ID. Useful if you don't know the ID of a pattern, but have the permalink.
    #
    # @example
    #   # Ravelry URL: http://www.ravelry.com/patterns/library/traveling-woman
    #   pattern = Ravelry::Pattern.new
    #   pattern.permalink_get('traveling-woman')
    #
    def permalink_get(permalink)
      @data = Utils::Request.get("patterns/#{permalink}.json", :pattern)
      self
    end

    # Get the list of comments on a pattern object.
    #
    # To query comments for a pattern you haven't fetched yet, without fetching the pattern:
    #
    # @example
    #   pattern = Ravelry::Pattern.new
    #   pattern.id = "000000"
    #   pattern.comments
    #
    # To query comments for a pattern you've already fetched, follow the steps above and call `pattern.comments`.
    #
    # See <COMMENT_OPTIONS> for valid options.
    #
    # @option options [String] :sort
    # @option options [Integer] :page_size
    # @option options [Array] :include
    # @option options [Integer] :page
    # @return [Array<Comment>] an array of `Comment`s
    #
    def comments(options={})
      @comment_list ||= []
      return @comment_list if @comment_list.any?

      fetch_comments(options)
    end

    # Search for patterns.
    #
    # Corresponds to Ravelry API endpoint `Patterns#search`
    #
    # @param query [String] required
    # @option options [Boolean] :personal_attributes
    # @option options [Integer] :page
    # @option options [Integer] :page_size
    # @return [Array<Pattern>] an array of `Pattern`s
    #
    def self.search(query, options={})
      params = {query: query}
      params.merge!(options)

      unless params[:personal_attributes].nil?
        params[:personal_attributes] = (params[:personal_attributes] ? 1 : 0)
      end

      patterns = Utils::Request
        .get("patterns/search.json", :patterns, params)

      patterns.map do |data|
        pattern = Ravelry::Pattern.new
        pattern.data = data
        pattern
      end
    end

    # Returns the original raw JSON.
    #
    def json
      data
    end

    # Creates all objects associated with your pattern; returns nothing; sets `attr_readers`.
    #
    # @return nil
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
    # @return Integer
    #
    def comments_count
      data[:comments_count]
    end

    # Gets currency from existing `data`.
    #
    # @return String
    #
    def currency
      data[:currency]
    end

    # Gets currency_symbol from existing `data`.
    #
    # @return String
    #
    def currency_symbol
      data[:currency_symbol]
    end

    # Returns the difficult average as a Float (this is how it is stored by Ravelry).
    #
    # @return Float
    #
    def difficulty_average_float
      data[:difficulty_average]
    end

    # Returns the difficulty average rounded up or down to an Integer.
    #
    # @return Integer
    #
    def difficulty_average_integer
      difficulty_average_float.round(0)
    end

    # Gets difficulty_count (Integer) from existing `data`.
    #
    # @return Integer
    #
    def difficulty_count
      data[:difficulty_count]
    end

    # Returns true if the pattern can be downloaded.
    #
    # @return Boolean
    #
    def downloadable?
      data[:downloadable]
    end

    # Gets favorites_count (Integer) from existing `data`.
    #
    # @return Integer
    #
    def favorites_count
      data[:favorites_count]
    end

    # Returns true if pattern is free.
    #
    # @return Boolean
    #
    def free?
      data[:free]
    end

    # Number of stitches per inch (or 4 inches).
    #
    # @return Float
    #
    def gauge
      data[:gauge]
    end

    # Sentence description of sts and row gauge with stitch.
    #
    # @return String
    #
    def gauge_description
      data[:gauge_description]
    end

    # Either 1 or 4 (inches).
    #
    # @return Integer
    #
    def gauge_divisor
      data[:gauge_divisor]
    end

    # Pattern for gauge listed.
    #
    # @return String
    #
    def gauge_pattern
      data[:gauge_pattern]
    end

    # Gets patter name from existing `data`.
    #
    # @return String
    #
    def name
      data[:name]
    end

    # Raw pattern notes. May be mixed Markdown and HTML. Generally only useful when presenting a pattern notes editor.
    #
    # @return String
    #
    def notes_raw
      data[:notes]
    end

    # Pattern notes rendered as HTML.
    #
    # @return String
    #
    def notes_html
      data[:notes_html]
    end

    # Returns an array of hashes with tons of information about each yarn listed in the pattern. See {#build} for a complete list of helper methods.
    #
    # I've included this method in case you want to have more control over how your pack information is displayed. It's likely that you'll want to use the other pack methods. While you sacrifice some fine tuning control, you also don't have to worry about dealing with a messy nested hash.
    #
    # If you're really determined to go through this manually, check out the [Ravelry documentation](http://www.ravelry.com/api#Pack_result).
    #
    # If iterating through the `packs` hash, you'll likely want to do something like this:
    #
    # @example
    #   packs = pattern.packs
    #   packs[0][:yarn_name]
    #   # returns a formatted string with the brand and yarn name.
    #
    # @return [Array<Hash>]
    #
    def packs_raw
      data[:packs]
    end

    # Helper that will tell you how many yarns you have in your pack.
    #
    # @return Integer
    #
    def pack_count
      data[:packs].length
    end

    # Returns a hash with information about the pattern author.
    #
    # I've included this method in case you want to have more control over how your author information is displayed.
    #
    # See {Ravelry::Author} for more information about directly accessing author information.
    #
    # @return Hash
    #
    def pattern_author
      data[:pattern_author]
    end

    # Returns an array of hashes with information about the categories.
    #
    # This method is included so you can access the information directly.
    #
    # See {Ravelry::Category} for more information about directly accessing category information.
    #
    # @return [Array<Hash>]
    #
    def pattern_categories_raw
      data[:pattern_categories]
    end


    # Returns an array of hashes with information about the needle sizes called for. Knitting only.
    #
    # This method is included so you can access the information directly.
    #
    # See {Ravelry::Needle} for more information about directly accessing category information.
    #
    # @return [Array<Hash>]
    #
    def pattern_needle_sizes_raw
      data[:pattern_needle_sizes]
    end

    # Returns an array of hashes with information about the pattern type.
    #
    # This method is included so you can access the information directly.
    #
    # See {Ravelry::Needle} for more information about directly accessing category information.
    #
    # @return [Array<Hash>]
    #
    def pattern_type_raw
      data[:pattern_type]
    end

    # Gets pdf_url from existing `data`.
    #
    # @return String
    #
    def pdf_url
      data[:pdf_url]
    end

    # Gets Ravelry permalink from existing `data`.
    #
    # @return String
    #
    def permalink
      data[:permalink]
    end

    # Returns an array of hashes with information about photo objects.
    #
    # This method is included so you can access the information directly.
    #
    # See {Ravelry::Photo} for more information about directly accessing category information.
    #
    # @return [Array<Hash>]
    #
    def photos_raw
      data[:photos]
    end

    # Gets price from existing `data`.
    #
    # @return Float
    #
    def price
      data[:price]
    end

    # Gets product_id from existing `data`.
    #
    # @return Integer
    #
    def product_id
      data[:product_id]
    end

    # Gets projects_count from existing `data`.
    #
    # @return Integer
    #
    def projects_count
      data[:projects_count]
    end

    # Gets publication date from existing `data`.
    #
    # @return Date
    #
    def published
      Date.parse(data[:published])
    end

    # Gets number of queued projects from existing `data`.
    #
    # @return Integer
    #
    def queued_projects_count
      data[:queued_projects_count]
    end

    # Gets rating_average from existing `data`.
    #
    # @return Float
    #
    def rating_average
      data[:rating_average]
    end

    # Gets number of ratings from existing `data`.
    #
    # @return Integer
    #
    def rating_count
      data[:rating_count]
    end

    # Returns true if pattern is a Ravelry download.
    #
    # @return Boolean
    #
    def ravelry_download?
      data[:ravelry_download]
    end

    # Gets row gauge from existing `data`.
    #
    # @return Float
    #
    def row_gauge
      data[:row_gauge]
    end

    # Gets sizes available from existing `data`.
    #
    # @return String
    #
    def sizes_available
      data[:sizes_available]
    end

    # Gets url from existing `data`.
    #
    # @return String
    #
    def url
      data[:url]
    end

    # Gets yardage required from existing `data`.
    #
    # @return Integer
    #
    def yardage
      data[:yardage]
    end

    # Gets nice sentence yardage description with range from existing `data`.
    #
    # @return String
    #
    def yardage_description
      data[:yardage_description]
    end

    # Gets max yards required from existing `data`.
    #
    # @return Integer
    #
    def yardage_max
      data[:yardage_max]
    end

    # Gets primary yarn weight description from existing `data`.
    #
    # @return String
    #
    def yarn_weight_description
      data[:yarn_weight_description]
    end

    private
    def fetch_comments(options)
      options.keep_if { |key| COMMENT_OPTIONS.keys.include?(key) }
      if options[:per_page]
        options[:per_page] = 100 if options[:per_page] > 100
      end

      comment_data = Utils::Request.get("patterns/#{@id}/comments.json", :comments, options)
      comment_data.map { |comment| Comment.new(comment) }
    end
  end
end
