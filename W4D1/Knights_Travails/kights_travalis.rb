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

    def remove_by_val(val)
        @children.reject!{|child| child.value == val}
    end
end

class KnightPathFinder
    SIZE = 8
    attr_accessor :pos, :path, :size, :root_node
    def initialize(pos)
        # @pos = pos
        # @path = [pos]
        @considered_positions = [pos]
        @root_node = Node.new(pos)
    end

    def self.valid_moves(pos)
        row, col = pos
        # return false if row > size || col > size
        valid_pos =[[row+1, col-2],[row+1, col+2], [row-1, col+2], [row-1, col-2],
                    [row-2, col+1],[row+2, col+1], [row+2, col-1], [row-2, col-1]]
        valid_pos.select{ |valid| (0...SIZE).include?(valid[1]) && (0...SIZE).include?(valid[0]) }
    end


    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_valid = valid_moves.reject{|new_pos| @considered_positions.include?(new_pos)}
        @considered_positions += new_valid
        new_valid
    end

    def build_move_tree
        queue = [@root_node]
        while queue != []
            new_pos = new_move_positions(queue[0].value)
            if new_pos.empty?
                queue += queue[0].children
            else 
                new_pos.each do |pos|
                    new_node = Node.new(pos)
                    queue[0].add_child(new_node)
                    queue << new_node
                end
            end
            queue.shift
        end
    end

    # def find_path(pos)
    #     queue = [[@root_node, [@root_node.value]]]
    #     # path = []
    #     until queue[0][0].value == pos
    #         p queue
    #         queue[0][0].children.each do |child|
    #             queue << [child, queue[0][1] + [child.value]]
    #         end
    #         queue.shift
    #     end
    #     return queue[0][1]
    # end

    def find_path(pos)
        queue = [@root_node]
        while !queue.empty?
            # p queue
            # puts
            break if queue.first.value == pos
            queue += queue.first.children
            queue.shift
        end
        return trace_path_back(queue[0])
    end

    def trace_path_back(node)
        return [node.value] if node.parent == nil
        return trace_path_back(node.parent) + [node.value]
    end
end
# [0-0] == node with value 0,0
# [0,0] == actual array of just [0,0]
# queue [ [1-2] , [[0,0],[1,2], "child 1,2"] ] [ [2-1] , [[0,0],[2,1]] ]
# << 
p "Initialize"
test = KnightPathFinder.new([0,0])
p "Build Move Tree"
test.build_move_tree
p "Find Path [7,6]"
p test.find_path([7,6])
p "Find Path [6,2]"
p test.find_path([6,2])