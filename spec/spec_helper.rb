$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'pry'
require 'ravelry'
require_relative 'helpers/helpers'
require_relative 'helpers/pattern_helpers'
require_relative 'helpers/pack_helpers'
require_relative 'helpers/yarn_helpers'
require_relative 'helpers/yarn_weight_helpers'
require_relative 'helpers/request_helpers'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Helpers
  config.include PatternHelpers
  config.include PackHelpers
  config.include YarnHelpers
  config.include YarnWeightHelpers
  config.include RequestHelpers
  config.order = "defined"
  config.before(:all) do
    Ravelry.configure do |config|
      config.access_key = ENV['RAV_ACCESS']
      config.secret_key = ENV['RAV_SECRET']
      config.personal_key = ENV['RAV_PERSONAL']
    end
  end

  config.before(:each) do
    Typhoeus::Expectation.clear
  end
end
