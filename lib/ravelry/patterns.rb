require 'curb'

module Ravelry

  class Patterns
    attr_reader :id, :pattern

    def initialize(id)
      @id = id
      @pattern = fetch_and_parse
    end

    def fetch_and_parse
      c = Curl::Easy.new("https://api.ravelry.com/patterns/#{@id}.json")
      c.http_auth_types = :basic
      c.username = ENV['RAV_ACCESS']
      c.password = ENV['RAV_PERSONAL']
      c.perform
      result = JSON.parse(c.body_str, {symbolize_names: true})
      return result[:pattern]
    end
  end

end