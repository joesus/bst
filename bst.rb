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

  def delete(node)

  end

end


