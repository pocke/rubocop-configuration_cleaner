require 'yaml'
require 'pathname'
require 'optparse'
require 'tempfile'

require "rubocop/configuration_cleaner/version"
require "rubocop/configuration_cleaner/cli"

module RuboCop
  module ConfigurationCleaner
    class Error < StandardError; end
    # Your code goes here...
  end
end
