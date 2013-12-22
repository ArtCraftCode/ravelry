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
      @pattern = fetch_and_parse if @id
    end

    def fetch_and_parse
      c = Curl::Easy.new("https://api.ravelry.com/patterns/#{@id}.json")
      c.http_auth_types = :basic
      c.username = ENV['RAV_ACCESS']
      c.password = ENV['RAV_PERSONAL']
      c.perform
      result = JSON.parse(c.body_str, {symbolize_names: true})
      @pattern = result[:pattern]
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

    def gauge
      pattern[:gauge]
    end
  end

end