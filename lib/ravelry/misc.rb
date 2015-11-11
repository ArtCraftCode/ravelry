module Ravelry

  # Handles API request for the `Misc` endpoints. Always returns an array of objects.
  #
  module Misc
    extend self

    # Handles GET API call and parses JSON response for the `Misc#color_families` Ravelry endpoint.
    #
    # Returns an array of {Ravelry::ColorFamily} objects.
    #
    def color_families
      result = Utils::Request.get("color_families.json", :color_families)
      result.data.map { |color_family| ColorFamily.new(color_family) }
    end

    # Handles GET API call and parses JSON response for the `Misc#color_families` Ravelry endpoint.
    #
    # Returns an array of {Ravelry::ColorFamily} objects.
    #
    def yarn_weights
      result = Utils::Request.get("yarn_weights.json", :yarn_weights)
      result.data.map { |yarn_weight| YarnWeight.new(yarn_weight) }
    end
  end
end