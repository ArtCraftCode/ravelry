module Ravelry

  # Parent class that controls initialization and fetching for API objects.
  class Data
    attr_accessor :id
    attr_reader :data

    def initialize(id=nil)
      @id = id
    end

    def data=(d)
      @data = d
      build
      self
    end

    private
    # Determines if a GET request needs to be made.
    def get?
      @id && !@data
    end
  end

end