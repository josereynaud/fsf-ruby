# Image Blur 2
# Using what was built in Image Blur 1, create a method called "blur(distance)" takes the value of 1
# and transform the 0 around it (top, buttom, left and right) to  be value of 1. Then, output the result. 

# Thought Process:
# Step 1: Sweep the arry to determine if there's a '1' in the multi-dimensional array.
# Step 2: For every '1' that we encounter, save the coordinates in a new array for later.
# Step 3: With the coordinates in hand, transform the values in each direction.
# Step 4: Output the result.

class Image
       
    def initialize(input)
        @picture = input
    end
    
    def output_image
        @picture.each do |x|
            puts x.join
        end
    end

    def blur(distance)
        # Step 1
        @coordinates = []
        @picture.each_with_index do |arry, arry_index|
            arry.each_with_index do |pos, pos_index|
                if pos == 1 
                    coordinate = Coordinates.new(arry_index, pos_index)
                    # Step 2
                    @coordinates << coordinate
                  end
            end
        end
        # Step 3
        get_array_length
        @coordinates.each do |cord|
            image_blur(cord, distance)
        end
        # Step 4
        output_image
    end

    def image_blur(cord, distance)
        t_arry = cord.instance_variable_get("@arry")
        t_pos = cord.instance_variable_get("@pos")
            @picture[ t_arry-distance][t_pos] = 1 if t_arry != 0 #top
            @picture[t_arry+distance][t_pos] = 1 if t_arry != @max_length_y #bottom
            @picture[t_arry][t_pos-distance] = 1 if t_pos != 0 #left
            @picture[t_arry][t_pos+distance] = 1 if t_pos != @max_length_x #right
    end

    def get_array_length
        column=@picture
        column.each_index do |y|
            row = column[y]
                row.each_with_index do |x, count_x|
                    @max_length_x = count_x
                end
                @max_length_y = y
        end    
    end
end

# Class to store the coordinates
class Coordinates

    def initialize(arry, pos)
        @arry = arry
        @pos = pos
    end
end

# Creation of a new array:
image = Image.new([
  [0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [1, 0, 0, 0, 0, 0]
])

# Output of the new array
puts "Non blurred:"
puts ""
image.output_image
puts ""
puts "Blurred:"
puts ""
image.blur(1)