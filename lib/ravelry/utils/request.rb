module Ravelry
  module Utils
    class Request
      def initialize(url, key)
        @url = url
        @key = key
        @request = Typhoeus::Request.get("https://api.ravelry.com/#{url}", userpwd: "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}")
      end

      def data
        data = JSON.parse(@request.response_body, {symbolize_names: true})
        data[@key]
      end
    end
  end
end