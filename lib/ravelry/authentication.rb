module Ravelry

  # OAuth 1 implementation for Ravelry.
  #
  class Authentication

    attr_reader :callback_url

    # Requires `callback_url` (string).
    #
    def initialize(callback_url)
      @access = ENV['RAV_ACCESS']
      @secret = ENV['RAV_SECRET']
      @session = {}
      @callback_url = callback_url
      @consumer = OAuth::Consumer.new(@access, @secret,
        :site => "https://www.ravelry.com")
      @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
      @session[:request_token] = @request_token
      result = Typhoeus.post(@request_token.authorize_url(:oauth_callback => @callback_url), followlocation: true)
      @access_token = @request_token.get_access_token
      @current_user = @access_token.get('/current_user.json')
    end
  end
end
