module Ravelry
  module Needles
    extend self

    def sizes
      request = Typhoeus::Request.get("https://api.ravelry.com/needles/sizes.json", userpwd: "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}")
      result = JSON.parse(request.response_body, {symbolize_names: true})
      result[:needle_sizes].map { |needle| Needle.new(needle, 'size') }
    end
  end
end