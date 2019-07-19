class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
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

def reverse_list(list, previous = nil)
  while list
    nxt = list.next_node
    list.next_node = previous
    previous = list
    if nxt == nil
      break
    else
      list = nxt
    end
  end
  return list
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)

# BONUS

def is_infinite?(list_node)
  fast_list_node = list_node
  slow_list_node = list_node
  while list_node
    return false if fast_list_node == nil

    slow_list_node = slow_list_node.next_node

    if fast_list_node.next_node != nil
      fast_list_node = fast_list_node.next_node.next_node
    else
      return false
    end

    return true if fast_list_node == slow_list_node
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3
puts "\nIs my linked list infinite?\n"
puts is_infinite?(node3)
