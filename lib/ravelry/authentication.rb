module Ravelry

  # OAuth 1 implementation for Ravelry.
  #
  class Authentication

    attr_reader :callback_url

    # Requires `callback_url` (string).
    #
    def initialize(callback_url)
      # * `RAV_ACCESS` - your Ravelry access key
      # * `RAV_SECRET` - your Ravelry secret key
      @callback_url = callback_url
    end

    # @callback_url = "http://127.0.0.1:3000/oauth/callback"
    # Create a new consumer instance by passing it a configuration hash:

    # @consumer = OAuth::Consumer.new("key","secret", :site => "https://agree2")
    # Start the process by requesting a token

    # @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
    # session[:request_token] = @request_token
    # redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
    # When user returns create an access_token

    # @access_token = @request_token.get_access_token
    # @photos = @access_token.get('/photos.xml')
    # Now that you have an access token, you can use Typhoeus to interact with the OAuth provider if you choose.

    # require 'oauth/request_proxy/typhoeus_request'
    # oauth_params = {:consumer => oauth_consumer, :token => access_token}
    # hydra = Typhoeus::Hydra.new
    # req = Typhoeus::Request.new(uri, options)
    # oauth_helper = OAuth::Client::Helper.new(req, oauth_params.merge(:request_uri => uri))
    # req.headers.merge!({"Authorization" => oauth_helper.header}) # Signs the request
    # hydra.queue(req)
    # hydra.run
    # @response = req.response
  end
end