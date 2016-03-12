require 'json'
require 'typhoeus'

DIRECTORIES = [ "#{File.dirname(__FILE__)}/ravelry/utils/*.rb",
                "#{File.dirname(__FILE__)}/ravelry/*.rb" ]

DIRECTORIES.map { |dir| Dir[dir].each { |file| require file } }

# Parent module for all classes.
# 
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