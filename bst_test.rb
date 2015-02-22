require 'minitest/autorun'
require_relative 'bst'

class BSTTest < MiniTest::Unit::TestCase

  def setup
    @node1 = BSTNode.new(value: 1)
    @node2 = BSTNode.new(value: 2)
    @node3 = BSTNode.new(value: 3)
    @node5 = BSTNode.new(value: 5)
    @node20 = BSTNode.new(value: 20)
    @bst = BSTNode.new(value: 2,
                       left: BSTNode.new(value: 1),
                       right: BSTNode.new(value: 3))
    @wikibst = BSTNode.new(value: 8,
                           left: BSTNode.new(value: 3,
                                             left: BSTNode.new(value: 1),
                                             right: BSTNode.new(value: 6,
                                                                left: BSTNode.new(value: 4))),
                           right: BSTNode.new(value: 10,
                                              right: BSTNode.new(value: 14)))
  end

  def test_root
    assert_equal true, @node1.root?
  end

  def test_to_s_orders_values
    assert_equal "1 2 3", @bst.to_s
    assert_equal "1 3 4 6 8 10 14", @wikibst.to_s
  end

  def test_insert_shallow
    assert_equal "1 2", @node2.insert(@node1).to_s
    assert_equal "1 2 3", @node2.insert(@node3).to_s
  end

  def test_insert_deeper
    assert_equal "1 3 4 5 6 8 10 14", @wikibst.insert(@node5).to_s
    assert_equal "1 3 4 5 6 8 10 14 20", @wikibst.insert(@node20).to_s
  end

  def test_search
    assert_equal 1, @wikibst.find(1).value
    assert_equal 6, @wikibst.find(6).value
    assert_equal nil, @wikibst.find(100)
  end

  def test_find_in_order_successor
    node3 = @wikibst.find(3)
    assert_equal 4, node3.right.find_minimum.value
  end

  def test_delete_right_leaf_node
    assert_equal "1 2", @bst.delete(3).to_s
  end

  def test_delete_left_leaf_node
    assert_equal "2 3", @bst.delete(1).to_s
  end

  def test_delete_one_child_node
    assert_equal "1 3 4 6 8 14", @wikibst.delete(10).to_s
  end

  def test_delete_two_children_node
    assert_equal "1 4 6 8 10 14", @wikibst.delete(3).to_s
  end
end