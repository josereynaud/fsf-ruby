# Image Blur 2
# Using what was built in Image Blur 1, create a method called "blur(distance)" takes the value of 1
# and transform the 0 around it (top, buttom, left and right) to  be value of 1. Then, output the result. 

# Thought Process:
# Step 1: Sweep the array to determine if there's a '1' in the multi-dimensional array.
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
        @coordinates.each do |cord|
            image_blur(cord, distance)
        end
        # Step 4
        output_image
    end

    def image_blur(cord, distance)
        t_arry = cord.arry
        t_pos = cord.pos
            @picture[ t_arry-distance][t_pos] = 1 if t_arry != 0                                             # TOP
            @picture[t_arry+distance][t_pos] = 1 if t_arry != (@picture.length-1)                # BOTTOM
            @picture[t_arry][t_pos-distance] = 1 if t_pos != 0                                               # LEFT
            @picture[t_arry][t_pos+distance] = 1 if t_pos != (@picture[t_arry].length-1)      # RIGHT
    end
end

# Class to store the coordinates
class Coordinates

    def initialize(arry, pos)
        @arry = arry
        @pos = pos
    end

# GETTER Methods
    def arry
        @arry
    end

    def pos
        @pos
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
puts "\nOriginal Image:\n\n"
image.output_image
puts "\nBlurred Image:\n\n"
image.blur(1)
puts "\n"