module Shoulda
  class << self
    attr_accessor :expected_exceptions
  end
end

class Test::Unit::TestCase
  class << self
    # Enables the core shoulda test suite to test for failure scenarios.  For
    # example, to ensure that a set of test macros should fail, do this:
    #
    #   should_fail do
    #     should_validate_presence_of :comments
    #     should_protect_attributes :name
    #   end
    def should_fail(&block)
      context "should fail when trying to run:" do
        Shoulda.expected_exceptions = [Test::Unit::AssertionFailedError]
        yield block
        Shoulda.expected_exceptions = nil
      end
    end
    
    # alias_method_chain hack to allow the should_fail macro to work
    def should_with_failure_scenario(name, &block)
      if Shoulda.expected_exceptions
        expected_exceptions = Shoulda.expected_exceptions
        failure_block = lambda { assert_raise(*expected_exceptions, &block.bind(self)) }
      end
      should_without_failure_scenario(name, &(failure_block || block))
    end
    alias_method_chain :should, :failure_scenario
  end
end
