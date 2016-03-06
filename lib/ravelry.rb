require 'json'
require 'typhoeus'

require 'ravelry/configuration'

require 'ravelry/utils/build'
require 'ravelry/utils/request'
require 'ravelry/utils/utilities'

require 'ravelry/author'
require 'ravelry/category'
require 'ravelry/color_family'
require 'ravelry/comment'
require 'ravelry/craft'
require 'ravelry/data'
require 'ravelry/misc'
require 'ravelry/needle'
require 'ravelry/needles'
require 'ravelry/pack'
require 'ravelry/pattern'
require 'ravelry/pattern_type'
require 'ravelry/photo'
require 'ravelry/printing'
require 'ravelry/social_site'
require 'ravelry/user'
require 'ravelry/user_site'
require 'ravelry/yarn'
require 'ravelry/yarn_weight'

# Parent grouping for all classes.
module Ravelry
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end