# Challenge: Write a program to play the Foobar game and display n elements of the Foobar pattern.
puts "How many items do you want to see?"
n = gets.to_i
iteration = n + 1

def foobar(iteration)
sum = 1
    while sum != iteration + 1
        if (sum % 3 == 0 && sum % 5 == 0)
            puts "#{sum}: Foobar"
            sum = sum + 1
        elsif (sum % 3 == 0)
            puts "#{sum}: Foo"
            sum = sum + 1
        elsif (sum % 5 == 0)
            puts "#{sum}: Bar"
            sum = sum + 1
        else
            puts "#{sum}: #{sum}"
            sum = sum + 1
        end
    end   
end

def foobar_explicit_blank_return(n)
n = n + 1
    n.times do |sum|
        if (sum == 0)
           sum = sum + 1       
        elsif (sum % 3 == 0 && sum % 5 == 0)
            puts "#{sum}: Foobar"
            sum = sum + 1
        elsif (sum % 3 == 0)
            puts "#{sum}: Foo"
            sum = sum + 1
        elsif (sum % 5 == 0)
            puts "#{sum}: Bar"
            sum = sum + 1
        else
            puts "#{sum}: #{sum}"
            sum = sum + 1
        end
    end         
    return
end

#puts foobar(n)
puts foobar_explicit_blank_return(n)