require 'minitest/autorun'
require_relative 'bst'

class BSTTest < MiniTest::Unit::TestCase

  def setup
    @node1 = BSTNode.new(value: 1)
    @node2 = BSTNode.new(value: 2)
    @node3 = BSTNode.new(value: 3)
    @node4 = BSTNode.new(value: 4)
    @node20 = BSTNode.new(value: 20)
    @bst = BSTNode.new(value: 2,
                       left: BSTNode.new(value: 1),
                       right: BSTNode.new(value: 3))
    @wikibst = BSTNode.new(value: 8,
                           left: BSTNode.new(value: 3,
                                             left: BSTNode.new(value: 1),
                                             right: BSTNode.new(value: 6)),
                           right: BSTNode.new(value: 10)
    )
  end

  def test_root
    assert_equal true, @node1.root?
  end

  def test_to_s_orders_values
    assert_equal "1 2 3", @bst.to_s
    assert_equal "1 3 6 8 10", @wikibst.to_s
  end

  def test_insert_shallow
    assert_equal "1 2", @node2.insert(@node1).to_s
    assert_equal "1 2 3", @node2.insert(@node3).to_s
  end

  def test_insert_deeper
    assert_equal "1 3 4 6 8 10", @wikibst.insert(@node4).to_s
    assert_equal "1 3 4 6 8 10 20", @wikibst.insert(@node20).to_s
  end

  def test_search
    assert_equal 1, @wikibst.find(1).value
    assert_equal 6, @wikibst.find(6).value
    assert_equal nil, @wikibst.find(100)
  end
end