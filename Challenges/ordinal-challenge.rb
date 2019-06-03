# Challenge: Write a program to determine the ordinal of a number and display it on the screen.

puts "Enter your number:"
number = gets.to_i
ordinal = number % 10

def get_ordinal(ordinal,number)

    if ordinal == 0 && number == 0
        return "ERROR: Please enter a number greater than 0"
    elsif (ordinal > 0 && ordinal <= 3) && (number > 10 && number <= 13)
        return "That's the #{number}th item!"
    elsif ordinal == 1
        return "That's the #{number}st item!"
    elsif ordinal == 2
        return "That's the #{number}nd item!"
    elsif ordinal == 3
        return "That's the #{number}rd item!"
    else return "That's the #{number}th item!"
    end
end

puts get_ordinal(ordinal,number)