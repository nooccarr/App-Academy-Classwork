require "byebug"
class Node
    def inspect
        @value.inspect
    end
    attr_reader :value
    attr_accessor :parent, :children
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent) # self = c1 parent = nil
        @parent.children.reject! {|child| child == self} unless @parent.nil? # cut connection
        parent.children << self unless parent.nil? # connect with new parent
        @parent = parent
    end

    def add_child(child)
        child.parent=self
    end

    def remove_child(child)
        raise "Error" if !self.children.include?(child)
        child.parent=nil
    end

    def remove_val(val)
        @children.reject!{|child| child.value == val}
    end
end

class KnightPathFinder
    SIZE = 8
    attr_accessor :pos, :path, :size, :root_node
    def initialize(pos)
        @pos = pos
        @path = []
        @considered_positions = [pos]
        @root_node = Node.new(pos)
    end

    def self.valid_moves(pos)
        row, col = pos
        # return false if row > size || col > size
        valid_pos =[[row+1, col-2],[row+1, col+2], [row-1, col+2], [row-1, col-2],
                    [row-2, col+1],[row+2, col+1], [row+2, col-1], [row-2, col-1]]
        valid_pos.select{ |valid| (0...SIZE).include?(valid[1]) && (0...SIZE).include?(valid[0])  }
    end


    def new_move_positions(pos)

    end

    def build_move_tree

    end
end

test = KnightPathFinder.new([3,3])