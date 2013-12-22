module Ravelry

  # Parent class that controls initialization and fetching for API objects.
  class Data
    attr_accessor :id
    attr_reader :data

    def initialize(id=nil, data=nil)
      @id = id
      @data = data if data
      @data = fetch_and_parse if fetch_api?
    end

    private
    # Determines if an API fetch needs to be made.
    def fetch_api?
      @id && !@data
    end
  end

end