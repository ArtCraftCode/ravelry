require 'oauth'

module Ravelry
  class OAuth
    def initialize
      @consumer = ::OAuth::Consumer.new(access_key, secret_key, site: request_token_url) 
    end

    def authorize
      @request_token.authorize_url(oauth_callback: callback_url)
    end

    def request_token
      @request_token ||= @consumer.get_request_token(oauth_callback: callback_url)
    end

    def access_token
      @access_token ||= @request_token.get_access_token
    end

    private

    def callback_url 
      Ravelry.configuration.callback_url
    end

    def access_key 
      Ravelry.configuration.access_key
    end

    def secret_key 
      Ravelry.configuration.secret_key
    end

    def request_token_url
      "https://www.ravelry.com/oauth/request_token"
    end
  end
end
