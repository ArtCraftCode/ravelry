module Ravelry
  class Configuration
    attr_writer :access_key, :secret_key, :personal_key, :callback_url

    def initialize
      @access_key = nil
      @secret_key = nil
      @personal_key = nil
      @callback_url = nil
    end

    def access_key
      raise ConfigurationError, "Ravelry access key missing! See the documentation for configuration settings." unless @access_key
      @access_key
    end

    def secret_key
      raise ConfigurationError, "Ravelry secret key missing! See the documentation for configuration settings." unless @secret_key
      @secret_key
    end

    def personal_key
      raise ConfigurationError, "Ravelry personal key missing! See the documentation for configuration settings." unless @personal_key
      @personal_key
    end

    def callback_url
      raise ConfigurationError, "Oauth callback url missing! See the documentation for configuration settings." unless @callback_url
      @callback_url
    end
  end
end