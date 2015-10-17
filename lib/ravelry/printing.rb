module Ravelry

  # The information used to create `Ravelry::Printing` objects comes from {Ravelry::Pattern} objects.
  #
  # You should not create `Printing` objects manually; they are all created–and owned–by a {Ravelry::Pattern}.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  class Printing

    attr_reader :price, :permalink, :name, :author, :url, :amazon_rating, :pattern_count, :amazon_url, :shelf_image_path, :list_price

    def initialize(printing)
      @printing = printing
      @pattern_source = printing[:pattern_source]

      # Price of the printing source.
      #
      @price = @pattern_source[:price]

      # Permalink for printing.
      #
      @permalink = @pattern_source[:permalink]

      # Name of the printing.
      #
      @name = @pattern_source[:name]

      # Author of the printed source (if any).
      #
      @author = @pattern_source[:author]

      # URL of the printing.
      #
      @url = @pattern_source[:url]

      # Printing's rating on Amazon.
      #
      @amazon_rating = @pattern_source[:amazon_rating]

      # Number of patterns available in this printing.
      #
      @pattern_count = @pattern_source[:pattern_count]

      # Printing's Amazon URL.
      #
      @amazon_url = @pattern_source[:amazon_url]

      # Path to image, if any.
      #
      @shelf_image_path = @pattern_source[:shelf_image_path]

      # List price of the printing.
      #
      @list_price = @pattern_source[:list_price]
    end

    # Boolean value. Is this resource out of print?
    #
    def out_of_print?
      @pattern_source[:out_of_print]
    end

    # Boolean value. Is this the primary source of the pattern?
    #
    def primary_source?
      @printing[:primary_source]
    end
  end
end