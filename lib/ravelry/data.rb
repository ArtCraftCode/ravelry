module Ravelry

  # Parent class that controls initialization and fetching for API objects.
  class Data
    attr_accessor :id, :data

    def initialize(id=nil, data=nil)
      @id = id
      @data = data if data
      @data = get if get?
    end

    private
    # Determines if a GET request needs to be made.
    def get?
      @id && !@data
    end
  end

end