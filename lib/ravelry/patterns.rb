require 'curb'

module Ravelry

# `Ravelry::Patterns` corresponds to the `patterns#show` Ravelry API route.
# 
# To use this, you must first initialize a Pattern object with the id. After initialization, you can access all of the class methods for your Pattern object.
# 
# The Pattern object can be passed an id as an integer or a string. See {file:README.md README} for information on accessing pattern IDs.
# 
# This class requires your environment variables be set (see README). API calls are authenticated using HTTP Basic Auth unless otherwise noted.
# 
# #Initialization with pattern id
# 
# Initializing the class with an id will automatically trigger an API call using your access key and personal key.
# 
# ```ruby
# pattern = Ravelry::Patterns.new("000000")
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
# I built this option with the knowledge that this class may have some future functionality not currently available. With this option, the API call doesn't happen until you call `setup`.
# 
# ```ruby
# pattern = Ravelry::Patterns.new
# pattern.id = "000000"
# pattern.setup
# ```
# 
# After calling `setup`, you have access to all of the class methods below.
# 
# # Methods
# 
# No explanation is given if the method name describes the result clearly.
# 
# If your `pattern` is missing one of these attributes, it will return `nil`.
# 
  class Patterns
    attr_reader :pattern
    attr_accessor :id

    def initialize(id=nil)
      @id = id
      setup if @id
    end

    def setup
      @pattern = fetch_and_parse
      build_packs
    end

    def comments_count
      pattern[:comments_count]
    end

    def craft_name
      pattern[:craft][:name]
    end

    def craft_permalink
      pattern[:craft][:permalink]
    end

    def currency
      pattern[:currency]
    end

    def currency_symbol
      pattern[:currency_symbol]
    end

    # Returns the difficult average as a Float (this is how it is stored by Ravelry).
    def difficulty_average_float
      pattern[:difficulty_average]
    end

    # Returns the difficulty average rounded up or down to an Integer.
    def difficulty_average_integer
      difficulty_average_float.round(0)
    end

    def difficulty_count
      pattern[:difficulty_count]
    end

    def downloadable?
      pattern[:downloadable]
    end

    def favorites_count
      pattern[:favorites_count]
    end

    def free?
      pattern[:free]
    end

    # Number of stitches per inch (or 4 inches). `Float`.
    def gauge
      pattern[:gauge]
    end

    # Sentence description of sts and row gauge with stitch.
    def gauge_description
      pattern[:gauge_description]
    end

    # Either 1 or 4 (inches). `Integer`.
    def gauge_divisor
      pattern[:gauge_divisor]
    end

    # Pattern for gauge listed.
    def gauge_pattern
      pattern[:gauge_pattern]
    end

    def name
      pattern[:name]
    end

    # Raw pattern notes. May be mixed Markdown and HTML. Generally only useful when presenting a pattern notes editor.
    def notes_raw
      pattern[:notes]
    end

    # Pattern notes rendered as HTML.
    def notes_html
      pattern[:notes_html]
    end

    # Returns an array of hashes with tons of information about each yarn listed in the pattern. More detail below.
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
    def packs
      pattern[:packs]
    end

    # Helper that will tell you how many yarns you have in your pack.
    def pack_count
      pattern[:packs].length
    end

    private
    def fetch_and_parse
      c = Curl::Easy.new("https://api.ravelry.com/patterns/#{@id}.json")
      c.http_auth_types = :basic
      c.username = ENV['RAV_ACCESS']
      c.password = ENV['RAV_PERSONAL']
      c.perform
      result = JSON.parse(c.body_str, {symbolize_names: true})
      @pattern = result[:pattern]
    end

    def build_packs
    end

    def set_attrs(hash)
      hash.each do |key, value|
        self.class.send(:define_method, key) { value }
      end
    end

  end

end