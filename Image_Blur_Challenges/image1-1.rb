# Image Blur #1
#  Build a class that allows us to build a new image with the data we specify. 
#  Make it possible for the class to output the image to the screen. 

## MENTOR REVIEW ##

class Image
       
    def initialize(input)
        @picture = input
    end
    
    def output_image
        @picture.each do |x|
            puts x.join
        end
    end

end

# The following code needs to work:
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image