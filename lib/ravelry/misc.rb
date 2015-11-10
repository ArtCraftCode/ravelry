module Ravelry

  module Misc
    extend self

    # Handles GET API call and parses JSON response for the `Misc#color_families` Ravelry endpoint.
    #
    # Returns an array of {Ravelry::ColorFamily} objects.
    #
    def color_families
      request = Typhoeus::Request.get("https://api.ravelry.com/color_families.json", userpwd: "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}")
      result = JSON.parse(request.response_body, {symbolize_names: true})
      @data = result[:color_families]
      @data.map { |d| ColorFamily.new(d) }
    end
  end
end