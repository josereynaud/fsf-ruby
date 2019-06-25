class LinkedListNode
    attr_accessor :value, :next_node
  
    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end
end

class Stack
    attr_reader :data

    def initialize
        @data = nil
    end

    def push(value)
        if @data == nil
            @node = LinkedListNode.new(@data=value)
            print "#{@node.value} --> "
        else
            @node = LinkedListNode.new(@data=value, value)
            print "#{@node.value} --> "
        end
    end

    def pop
        if @data != nil
            @node = LinkedListNode.new(nil, @data)
            print "#{@node.value} --> "
        else
            print "nil\n"
            return nil
        end
    end

end

    def print_values(list_node)
        if list_node
          print "#{list_node.value} --> "
          print_values(list_node.next_node)
        else
          print "nil\n"
          return
        end
    end

    def reverse_list(list)
        # ADD CODE HERE
    
        while list
            # ADD CODE HERE
            list = list.next_node
        end
    
        # ADD CODE HERE
    end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

stack = Stack.new
stack.push(1)
stack.push(5)
stack.push(10)
puts stack.pop
puts stack.pop
# puts stack.pop
# puts stack.pop
puts stack.inspect

print_values(node3)
# puts "-------"
# revlist = reverse_list(node3)
# print_values(revlist)