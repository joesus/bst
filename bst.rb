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

  def find(node)
    # TODO - implement
  end

  def delete(node)
    # TODO - implement
  end

end


