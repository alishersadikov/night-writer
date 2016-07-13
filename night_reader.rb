class FileReader
  attr_reader :braille_message

  # def initialize
  #   @reader = FileReader.new
  # end

  def self.read_braille_message
    @content = File.read(ARGV[1])
  end

  def self.decrypt_file_to_english
    # bc = BrailleConverter.new(@english_message)
    # message_contents = bc.convert_to_full_braille
    # File.write(ARGV[1], message_contents)
    # puts "Created #{ARGV[1]} containing #{message_contents.length} characters"
  end
end

NightWriter.read_braille_message
NightWriter.decrypt_file_to_english
