require File.dirname(__FILE__) + '/../test_helper'

class TaggingTest < Test::Unit::TestCase
  should_belong_to :post
  should_belong_to :tag

  shared "tag awesomeness" do
    setup do
      @setup_block_ran = true
    end

    should "do stuff" do
      assert @setup_block_ran
    end
  end

  uses "tag awesomeness"

  should "have a test called 'test: tag awesomness should do stuff. '" do
    assert self.class.instance_methods.include?("test: tag awesomeness should do stuff. "), self.class.instance_methods.grep(/test:/).inspect
  end
end
