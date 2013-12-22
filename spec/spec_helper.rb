$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'ravelry'
require 'helpers'
require 'pattern_helpers'
require 'pack_helpers'
require 'yarn_helpers'
require 'yarn_weight_helpers'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include Helpers
  config.include PatternHelpers
  config.include PackHelpers
  config.include YarnHelpers
  config.include YarnWeightHelpers
  config.order = "random"
end
