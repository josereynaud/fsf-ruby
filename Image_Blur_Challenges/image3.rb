# Image Blur 3
# Using what was built in Image Blur 2, change the blur method to increase the distance to greater than 1.
# Note that it should also paint diagonally according to the distance. 

# Thought Process:
# Basically all the methods are done from image2.rb. In this case we need to understand that the bigger the
# distance, we have to paint individually in each index to be able to paint diagonally without a problem.
# To do this, and also with escalability in mind, a recursive version of the function image_blur should do the
# trick. Extra validations needed to be added in order to avoid painting out of bounds.

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
        @coordinates = []
        @picture.each_with_index do |arry, arry_index|
            arry.each_with_index do |pos, pos_index|
                if pos == 1 
                    coordinate = Coordinates.new(arry_index, pos_index)
                    @coordinates << coordinate
                  end
            end
        end
        @coordinates.each do |cord|
            image_blur(cord.arry, cord.pos, distance)
        end
        output_image
    end

    def image_blur(arry, index, distance)
        if distance > 1
            image_blur(arry, index, distance-1)                                                                     # ORIGIN
            image_blur(arry-1, index, distance-1) if arry != 0 || arry < 0                                # TOP
            image_blur(arry+1, index, distance-1) if arry < (@picture.length-(distance-1))   # BOTTOM
            image_blur(arry, index-1, distance-1) if index != 0 || index < 0                            # LEFT
            image_blur(arry, index+1, distance-1) if index != (@picture[arry].length-(1))      # RIGHT
        elsif distance == 1
            @picture[arry-1][index] = 1 if arry != 0 || arry < 0                                                 # TOP
            @picture[arry+1][index] = 1 if arry < (@picture.length-1)                                    # BOTTOM
            @picture[arry][index-1] = 1 if (index != 0 || index < 0)                                         # LEFT
            @picture[arry][index+1] = 1  if index < (@picture[arry].length-1)                         # RIGHT
        end
    end
end

class Coordinates

    def initialize(arry, pos)
        @arry = arry
        @pos = pos
    end

    def arry
        @arry
    end

    def pos
        @pos
    end
end

# Creation of a new array:
image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0]
])

# Output of the new array
puts "\nOriginal Image:\n\n"
image.output_image
puts "\nBlurred Image:\n\n"
image.blur(3)
puts "\n"