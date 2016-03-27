module Ravelry

  # Adds global configuration settings to the gem, including:
  # 
  # * `config.access_key` - your Ravelry access key
  # * `config.secret_key` - your Ravelry secret key
  # * `config.personal_key` - your Ravelry personal key; primarily used for OAuth
  # * `config.callback_url` - for OAuth, the callback url for your authentication requests
  # 
  # To request API keys for Ravelry, sign up for a free Ravelry account and visit this page for instructions:
  # http://www.ravelry.com/discuss/ravelry-api/topics/1979523#1
  # 
  # # Required fields
  # 
  # The following fields are *required* to use the gem:
  # 
  # - Access key
  # - Secret key
  # - Personal key
  # 
  # The gem will raise a `ConfigurationError` if you fail to provide these keys.
  # 
  # # Configuring your gem
  #
  # ```
  # Ravelry.configure do |config|
  #   config.access_key = ''
  #   config.secret_key = ''
  #   config.personal_key = ''
  #   config.callback_url = ''
  # end
  # ```
  #
  # # Accessing configuration settings
  # 
  # All settings are available on the `Ravelry.configuration` object:
  # 
  # ```
  # Ravelry.configuration.access_key
  # Ravelry.configuration.secret_key
  # Ravelry.configuration.personal_key
  # Ravelry.configuration.callback_url
  # ```
  # # Resetting configuration
  # 
  # To reset, simply call `Ravelry.reset`.
  # 
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