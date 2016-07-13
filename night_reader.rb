class FileReader
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def encode_to_braille(input)
    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
  end
end
