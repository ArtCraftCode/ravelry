require 'curb'

module Ravelry

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

    def difficulty_average_float
      pattern[:difficulty_average]
    end

    def difficulty_average_integer
      difficulty_average_float.to_i
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

    # Could be super fancy and dynamtically create methods
    # but then I wouldn't have much control over things, and the only way
    # to really be sure about the results would be to test it.
    # def set_attrs
    #   pattern.each do |key, value|
    #     self.class.send(:define_method, key) { value }
    #   end
    # end

  end

end