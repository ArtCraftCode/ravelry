module Ravelry

  # The information used to create `Ravelry::PatternType` objects comes from {Ravelry::Pattern} objects.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  # You should not need to create `PatternType` objects manually; they are all created–and owned–by a {Ravelry::Pattern}.
  #
  # Note that there are other API endpoints for pattern categorization; this might not be the one that you're looking for.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  class PatternType

    attr_reader :permalink, :name

    def initialize(type)
      @type = type

      # Ravelry vanity permalink for the type. Note: not a full URL.
      #
      @permalink = type[:permalink]

      # Name of the type.
      #
      @name = type[:name]
    end

    # Boolean value; determins if category qualifies as clothing.
    def clothing?
      @type[:clothing]
    end
  end
end