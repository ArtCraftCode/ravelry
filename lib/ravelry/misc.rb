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
      result.map { |color_family| ColorFamily.new(color_family) }
    end

    # Handles GET API call and parses JSON response for the `Misc#color_families` Ravelry endpoint.
    #
    # Returns an array of {Ravelry::ColorFamily} objects.
    #
    def yarn_weights
      result = Utils::Request.get("yarn_weights.json", :yarn_weights)
      result.map { |yarn_weight| YarnWeight.new(yarn_weight) }
    end

    # Make a GET API call for the current authenticated user. Without the OAuth setup, this will just be you, the requester.
    # 
    # Returns a {Ravelry::User} object.
    # 
    # Note: the returned `User` won't have everything from a standard {Ravelry::User} request, but you will have the information necessary to make a request for the full profile if desired.
    # 
    def current_user
      result = Utils::Request.get("current_user.json", :user)
      user = Ravelry::User.new
      user.data = result
      return user
    end
  end
end