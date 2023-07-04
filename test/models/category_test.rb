require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should be valid with valid attributes' do
    category = Category.new(name: 'Test Category', description: 'Test Description')
    assert category.valid?
  end

  test 'should not be valid without a name' do
    category = Category.new(description: 'Test Description')
    assert_not category.valid?
  end

  test 'should have a unique name' do
    existing_category = Category.create(name: 'Existing Category', description: 'Test Description')
    new_category = Category.new(name: 'Existing Category', description: 'Test Description')
    assert_not new_category.valid?
  end

  test 'should have a name between 2 and 15 characters' do
    category = Category.new(name: 'A', description: 'Test Description')
    assert_not category.valid?

    category.name = 'A' * 16
    assert_not category.valid?

    category.name = 'Valid Category'
    assert category.valid?
  end

  test 'should have a description between 5 and 25 characters' do
    category = Category.new(name: 'Test Category', description: 'A')
    assert_not category.valid?

    category.description = 'A' * 26
    assert_not category.valid?

    category.description = 'Valid Description'
    assert category.valid?
  end
end
