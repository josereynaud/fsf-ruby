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
  iteration = list
  while iteration
    puts "Step 1: Snapshot the current head's values\n"
    nxt = list.next_node
    puts "nxt is #{nxt.value} and its next value's head is #{nxt.next_node.value}"
    puts "Step 2: Mutate the pointer to previous (first value is nil)\n"
    print_values(iteration)
    list.next_node = previous # for some reason, when I do this I lose the pointer in iteration, which I am not mutating in any point. But if I don't do this, the code won't iterate properly
    print_values(iteration)
    puts "list.next_node is #{list.next_node}"
    puts "Step 3: Alter the previous value \n"
    previous = list
    puts "previous is #{previous.value} and its next value's head is #{previous.next_node}"
    puts "Step 4: Mutate the list value to reflect the next node in line\n"
    list = nxt
    puts "list is #{list.value} and its next value's head is #{list.next_node.value}"
    puts "Step 5: Change the pointer to our previous head\n"
    list.next_node = previous
    puts "list.next_node is now #{list.next_node.value}"
    puts "value is #{list.value} and next is #{list.next_node.value}"
    puts "Step 6: Iterate through the list"
    iteration = iteration.next_node
    puts "list is now #{list.value} and the next is #{list.next_node.value}"
    puts "end of loop\n"
    print_values(iteration)
    puts "<><><>"
  end
  return list
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
#node3.reverse_list!(node3)
revlist = reverse_list(node3)
print_values(node3)
