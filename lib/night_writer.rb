# create a class that can read files
# and this class should also be able to read input text file
# from terminal and display the new text file on the terminal
# this should be accompanied by message: "Created braille.txt
# containing 256 characters"

class NightWriter
  attr_reader :content

  def self.read_contents
    @content = File.read(ARGV[0])
  end

  def self.write_contents
    File.write(ARGV[1], @content)
  end

  def self.verify_the_write
      puts "Created #{ARGV[1]} containing #{@content.length} characters"
  end
end


NightWriter.read_contents
NightWriter.write_contents
NightWriter.verify_the_write

# class NightWriter
#
#   def self.read_and_write_contents
#     content = File.read(ARGV[0])
#     File.write(ARGV[1], content)
#
#     puts "Created #{ARGV[1]} containing #{content.length} characters"
#   end
# end
#
# NightWriter.read_and_write_contents


# (3) define a method that can copy file content from ARGV[0] and print to
# ARGV[1] 3 times.

# (4) output the braille characters to the file
    #build a component that takes in a plain english text letter and a position
    #(maybe numbered 0-5) and return either a "0" or "."
# .new.read_and_write_contents
