require "byebug"
class PolyTreeNode
    def inspect
        @value.inspect
    end
    attr_reader :parent, :value
    attr_accessor :children
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)     # assigning a parent    # self is a child
        # @parent is your current parent. we want to remove ourself from their list
        @parent.children.reject!{|child| child == self} unless @parent.nil?
        # parent is your self's new parent. add yourself to their list of children
        parent.children << self unless parent.nil? || parent.children.include?(self)
        # tell yourself that you @parent is now parent (passed in)
        @parent = parent
    end

    def add_child(child)    # assigning a child     # self is a parent
        # tells child to call parent and set it to self
        child.parent = self
    end

    def remove_child(child) # removing a child      # self is a parent
        # check if child is in our list of children
        raise("Not my child") if !self.children.include?(child)
        # set it to nil and let parent=() method handle the rest
        child.parent = nil 
    end

    def dfs(val)
        return self if @value == val
        # debugger
        @children.each do |child|
            box = child.dfs(val)
            if box != nil
                return box
            end
        end
        nil
    end

    def bfs(val)
        return self if self.value == val

        child_list = self.children.dup
        while !child_list.empty?
            if child_list[0].value == val
                return child
            else
                child_list += child_list[0].children
                child_list.shift
            end
        end
        nil
    end
end

# initialization
nodex = PolyTreeNode.new("head")
nodez = PolyTreeNode.new("child1")
nodey = PolyTreeNode.new("child2")
child3 = PolyTreeNode.new("child3")
child4 = PolyTreeNode.new("child4")
nodea = PolyTreeNode.new("target")
# connections
nodex.add_child(nodez)
nodex.add_child(nodey)
nodey.add_child(nodea)
nodea.add_child(child4)
nodez.add_child(child3)
# dfs
p nodex.bfs("fake")
p nodex.bfs("target")
p nodex.children