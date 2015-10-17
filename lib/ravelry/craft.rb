module Ravelry

  # The information used to create `Ravelry::Craft` currently comes from {Ravelry::Pattern} objects.
  #
  # You should not create `Craft` objects manually; they are all created–and owned–by a {Ravelry::Pattern}.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  class Craft

    attr_reader :permalink, :name

    def initialize(data)
      @permalink = data[:permalink]
      @name = data[:name]
    end
  end
end

