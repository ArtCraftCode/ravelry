module Ravelry

  # Parent class that controls initialization and fetching for API objects.
  class Data
    attr_accessor :id, :data

    def initialize(id=nil)
      @id = id
      @data = data
    end

    private
    # Determines if a GET request needs to be made.
    def get?
      @id && !@data
    end
  end

end