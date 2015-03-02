require 'pry-nav'
require_relative 'ast'

class BSTNode < ASTNode

  def insert(node)
    if node.value < self.value
      self.left.nil? ? self.left = node : self.left = self.left.insert(node)
    elsif node.value > self.value
      self.right.nil? ? self.right = node : self.right = self.right.insert(node)
    end
    self
  end

  def find(value)
    if value < self.value
      self.left.find(value) unless self.left.nil?
    elsif value > self.value
      self.right.find(value) unless self.right.nil?
    else
      self
    end
  end

  def delete(value)
    node = find(value)
    if node.leaf?
      node.replace_self_with(nil) if node.leaf?
    elsif node.left && node.right
      successorValue = node.right.find_minimum.value
      self.delete(successorValue)
      node.value = successorValue
    else
      node.left.nil? ? node.replace_self_with(node.right) : node.replace_self_with(node.left)
    end
    self
  end

  # a) if the node is the left child of its parent,
  # then it must be smaller than (or equal to) the parent
  # and it must pass down the value from its parent to its right subtree
  # to make sure none of the nodes in that subtree is greater than the parent,
  # and similarly b) if the node is the right child of its parent,
  # then it must be larger than the parent and it must pass down the value from its parent
  # to its left subtree to make sure none of the nodes in that subtree
  # is lesser than the parent.
  def valid_bst?
    binding.pry
    if !self.left.nil?
      true if self.left.maximum > self.value
    else
      self.value if self.left.valid_bst? < self.value
    end
  end

  def find_maximum
    self.right.nil? ? self : self.right.find_maximum
  end

  def find_minimum
    self.left.nil? ? self : self.left.find_minimum
  end

  def replace_self_with(node)
    self == self.parent.left ? self.parent.left = node : self.parent.right = node
  end
end


