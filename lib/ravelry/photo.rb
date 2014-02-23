module Ravelry

  # The information used to create `Ravelry::Photo` currently comes from {Ravelry::Pattern} objects.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  # To utilize the `get`, `post`, `delete`, `get_sizes` methods, you have to be authenticated.
  #
  class Photo < Data

    def get
      # TODO - requires authentication
    end

    def post
      # TODO - requires authentication
    end

    def delete
      # TODO - requires authentication
    end

    def get_sizes
      # TODO - requires authentication
    end

    def flickr_url
      data[:flickr_url]
    end

    def small_url
      data[:small_url]
    end

    def medium_url
      data[:medium_url]
    end

    def square_url
      data[:square_url]
    end

    def thumbnail_url
      data[:thumbnail_url]
    end

    def shelved_url
      data[:shelved_url]
    end

    def sort_order
      data[:sort_order]
    end

    # Offsets are used to place a small image in a 170x170 pixel square frame.
    #
    def x_offset
      data[:x_offset]
    end

    # Offsets are used to place a small image in a 170x170 pixel square frame.
    #
    def y_offset
      data[:y_offset]
    end
  end
end