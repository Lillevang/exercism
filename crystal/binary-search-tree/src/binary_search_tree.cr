# Please implement your solution to binary-search-tree in this file
class Node

  include Enumerable(Int32)
  include Iterable(Int32)

  property value : Int32
  property left : Node?
  property right : Node?

  def initialize(@value : Int32)
  end

  def insert(n : Int32)
    if n <= @value
      @left = @left.try &.insert(n) || Node.new(n)
    elsif n >= @value
      @right = @right.try &.insert(n) || Node.new(n)
    end
    self
  end

  def search(target_val : Int32)
    if target_val == @value
      self
    elsif target_val < @value
      @left.try &.search(target_val)
    elsif target_val > @value
      @right.try &.search(target_val)
    end
  end
  
  def each
    NodeIterator.new(self)
  end

  def each
    each.each do |value|
      yield value
    end
  end

  def delete(target)
    if @value == target
      if @left.nil? && @right.nil?
        return nil
      elsif @left.nil?
        copy(@right.not_nil!)
      elsif @right.nil?
        copy(@left.not_nil!)
      else
        @value = @right.not_nil!.min.tap { |v| delete(v) }
      end
    elsif @value > target
      @left = @left.try &.delete(target)
    elsif @value < target
      @right = @right.try &.delete(target)
    end
    self
  end

  private def copy(other_node)
    @value = other_node.value
    @right = other_node.right
    @left = other_node.left
  end


  private class NodeIterator

    include Iterator(Int32)

    @root : Node
    @current : Node?

    def initialize(@root)
      @current = @root
      @nodes = [] of Node?
      @values = Array(Int32).new
    end

    def next
      if @current.nil?
        if @nodes.empty?
          return stop
        else
          @current = @nodes.pop
          return @values.pop
        end
      end

      until(current = @current).nil?
        @values << current.value
        @nodes << current.right
        @current = current.left
      end
      self.next
    end
  end
end
