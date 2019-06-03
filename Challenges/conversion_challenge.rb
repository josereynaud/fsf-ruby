# Challenge: write a program to convert temperatures from Celsius to Fahrenheit.

puts "Insert your temperature in Celcius:"
C_temp = gets.to_f

# Formula:
# (0 °C × 1.8) + 32

def C2F (temp)
    conversion = (temp*1.8)+32
end

puts "Your temperature is #{C2F(C_temp)} F"