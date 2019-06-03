# Image Blur #1
#  Build a class that allows us to build a new image with the data we specify. 
#  Make it possible for the class to output the image to the screen. 

# Class Creation:

class Image
    attr_accessor :array, :row, :sum
    
    def initialize(input)
        self.array = []
        self.sum = ""
        
        # Define a nested loop that goes through each value of the 2D array and convert it to a string.
            input.each_index do |i|
                row = input[i]
                    row.each_index do |x|
                    # Covert the selected index to string and concatenate the outputs to the sum variable
                    self.sum = self.sum << input[i][x].to_s
                    end
                
            # Add the concatenated row to the array
                self.array << self.sum
            # Clear the concatenation 
                self.sum = ""
            end
            
    end
    
    def output_image
        puts self.array
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


