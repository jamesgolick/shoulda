require File.dirname(__FILE__) + '/../test_helper'

class PostTest < Test::Unit::TestCase
  fixtures :all

  should_belong_to :user
  should_belong_to :owner
  should_have_many :tags, :through => :taggings
  should_have_many :through_tags, :through => :taggings

  should_validate_uniqueness_of :title
  should_validate_presence_of :body, :message => /wtf/
  should_validate_presence_of :title
  should_only_allow_numeric_values_for :user_id
end
