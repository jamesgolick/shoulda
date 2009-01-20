$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'activesupport' if defined? RAILS_ROOT
require 'test/unit'
require 'active_support/test_case' if defined? RAILS_ROOT
require 'context'

module Shoulda
end

require 'shoulda/helpers'
require 'shoulda/assertions'
require 'shoulda/macros'
require 'shoulda/adapters/rails' if defined? RAILS_ROOT

module Test # :nodoc: all
  module Unit
    class TestCase
      extend Shoulda::Helpers
      include Shoulda::Assertions
      extend  Shoulda::Macros
    end
  end
end
