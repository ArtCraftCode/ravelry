require 'curb'

module Ravelry

# `Ravelry::Patterns` corresponds to the `patterns#show` Ravelry API route.
# 
# To use this, you must first initialize a Pattern object with the id. After initialization, you can access all of the class methods for your Pattern object.
# 
# The Pattern object can be passed an id as an integer or a string. See {file:README.md README} for information on accessing pattern IDs.
# 
# This class requires your environment variables be set (see {file:README.md README}). API calls are authenticated using HTTP Basic Auth unless otherwise noted.
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
# I built this option with the knowledge that this class may have some future functionality not currently available. With this option, the API call doesn't happen until you call `fetch_and_parse`.
# 
# ```ruby
# pattern = Ravelry::Patterns.new
# pattern.id = "000000"
# pattern.fetch_and_parse
# ```
# 
# After calling `fetch_and_parse`, you have access to all of the class methods below.
# 
# # Building associated objects
# 
# You will need to call special methods to create the associated objects with your pattern.
# 
# ## Creating all objects: {#build_all_objects}
# 
# To create all associated objects at once, call the following method after initialization:
# 
# ```ruby
# pattern.build_all_objects
# ```
# 
# ### To create yarn packs only: {#build_packs}
# 
# *Note: this method currently does not create objects, just a bunch of helper methods.*
# 
# ```ruby
# pattern.build_packs
# ```
# 
# ### To create author objects only: {#build_authors}
# 
# ```ruby
# pattern.build_authors
# ```
# 
# ## Accessing objects
# 
# To access the array of `Ravelry::Author` objects associated with your pattern:
# 
# ```ruby
# pattern.authors
# # => [#<Ravelry::Author:0x007fe38317dc48>]
# ```
# 
# #Method definitions
# 
# No explanation is given if the method name describes the result clearly.
# 
# If your `pattern` is missing one of these attributes, it will return `nil`.
# 
# #Important note: {#packs}
# 
# The {#packs} method returns an array of all yarns associated with the pattern. You can access items directly in the array if you choose, or you can use the helper methods.
# 
# {#setup} triggers {#build_packs}, which magically creates helper methods that let you access each yarn in your pack. If you're planning on using `pack` data, it is **very important** that you read the documentation for {#build_packs}.
# 
# **See {#build_packs} for a complete list of `pack` attributes and how to access them**.
# 
  class Patterns
    attr_reader :pattern, :authors
    attr_accessor :id

    def initialize(id=nil)
      @id = id
      @pattern = fetch_and_parse if @id
    end

    # Handles API call and parses JSON response. 
    def fetch_and_parse
      c = Curl::Easy.new("https://api.ravelry.com/patterns/#{@id}.json")
      c.http_auth_types = :basic
      c.username = ENV['RAV_ACCESS']
      c.password = ENV['RAV_PERSONAL']
      c.perform
      result = JSON.parse(c.body_str, {symbolize_names: true})
      @pattern = result[:pattern]
    end

    # Creates all objects associated with your pattern; returns nothing.
    # 
    # Inside of the `associated` hash, you have the following keys:
    # 
    # * `:authors` - Array of `Author` objects
    # 
    # Also generates helper methods for `packs`.
    def build_all_objects
      build_packs
      build_authors
    end

    # **Very important magic here:** dynamitcally creates methods for each yarn in `pack`.
    # 
    # Generates the following methods for each yarn in pack:
    # 
    # *Note that "n" is the index of the item in the `pack` array (starts at `0`). Use {#pack_count} helper to see the number of items in your `pack`.*
    # 
    # * `pack_n_yarn` - brand and name of yarn as one string (ex: "Lorna's Laces Shepherd Sock").
    # * `pack_n_permalink` - Ravelry permalink for yarn
    # * `pack_n_company` - brand/company name
    # * `pack_n_name` - yarn name
    # * `pack_n_yardage_description` - range of yardage required for project
    # * `pack_n_weight` - yarn weight
    # 
    # Eventually this will be replaced with a `Ravelry::Packs` object.
    # 
    def build_packs
      packs.each_with_index do |pack, index|
        p = {
              "pack_#{index}_yarn" => pack[:yarn_name],
              "pack_#{index}_permalink" => pack[:yarn][:permalink],
              "pack_#{index}_company" => pack[:yarn][:yarn_company_name],
              "pack_#{index}_name" => pack[:yarn][:name],
              "pack_#{index}_yardage_description" => pack[:_yardage_description],
              "pack_#{index}_weight" => pack[:yarn_weight][:name]
            }
        set_attrs(p)
      end
    end

    # Creates `Ravelry::Author` object for each author; returns an Array of `Author` objects.
    def build_authors
      @authors = []
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
    def packs
      pattern[:packs]
    end

    # Helper that will tell you how many yarns you have in your pack.
    def pack_count
      pattern[:packs].length
    end

    # Returns a hash with information about the pattern authors.
    # 
    # I've included this method in case you want to have more control over how your author information is displayed.
    # 
    # See {#build_authors} for more information about directly accessing author information.
    # 
    def pattern_author
      pattern[:pattern_author]
    end

    private
    def set_attrs(hash)
      hash.each do |key, value|
        self.class.send(:define_method, key) { value }
      end
    end

  end

end