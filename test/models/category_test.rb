require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    # runs every time you run the test
    @category = Category.new(name: "travel")
  end

  test "category should be valid" do
      assert @category.valid?
  end

  test "name should be present" do
      @category.name = " "
      assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "travel")
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end