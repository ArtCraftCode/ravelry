require 'json'
require 'typhoeus'
require 'oauth'

require_relative 'ravelry/utils/build'
require_relative 'ravelry/utils/utilities'

require_relative 'ravelry/authentication'
require_relative 'ravelry/author'
require_relative 'ravelry/category'
require_relative 'ravelry/craft'
require_relative 'ravelry/data'
require_relative 'ravelry/pack'
require_relative 'ravelry/pattern'
require_relative 'ravelry/pattern_needle'
require_relative 'ravelry/pattern_type'
require_relative 'ravelry/photo'
require_relative 'ravelry/printing'
require_relative 'ravelry/yarn'
require_relative 'ravelry/yarn_weight'

# Parent grouping for all classes.
module Ravelry; end