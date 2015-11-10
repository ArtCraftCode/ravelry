module Ravelry

  # The API endpoint for fetching `ColorFamilies` can be found in {Ravelry::Misc}.
  #
  # A `ColorFamily` object can be created by several different endpoints but is currently only implemented in {Ravelry::Misc}.
  #
  class ColorFamily
    attr_reader :id, :name, :permalink, :spectrum_order, :color

    # Creates new `ColorFamily` from Ravelry API ColorFamily attributes.
    #
    # All class variables are readonly.
    #
    def initialize(color_family)
      @id = color_family[:id]
      @color = color_family[:color]
      @permalink = color_family[:permalink]
      @name = color_family[:name]
      @spectrum_order = color_family[:spectrum_order]
    end
  end

end
