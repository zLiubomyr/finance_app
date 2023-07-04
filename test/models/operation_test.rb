require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.create(name: 'Test Category', description: 'Test Description')
    @operation = Operation.new(amount: 100, odate: Time.now, description: 'Test Operation', category: @category)
  end

  test 'should be valid with valid attributes' do
    assert @operation.valid?
  end

  test 'should not be valid without an amount' do
    @operation.amount = nil
    assert_not @operation.valid?
  end

  test 'should not be valid without an odate' do
    @operation.odate = nil
    assert_not @operation.valid?
  end

  test 'should not be valid without a description' do
    @operation.description = nil
    assert_not @operation.valid?
  end

  test 'should belong to a category' do
    assert_equal @category, @operation.category
  end
end
