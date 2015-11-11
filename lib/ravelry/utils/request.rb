module Ravelry
  module Utils
    module Request
      extend self

      def get(url, key)
        request = Typhoeus::Request.get("https://api.ravelry.com/#{url}", userpwd: "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}")
        data = JSON.parse(@request.response_body, {symbolize_names: true})
        return data[key] if key
        return data
      end
    end
  end
end