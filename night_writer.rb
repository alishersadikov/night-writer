require './lib/braille_converter'

class NightWriter
  attr_reader :english_message

  def self.read_english_message
    @english_message = File.read(ARGV[0])
  end

  def self.encode_file_to_braille
    bc = BrailleConverter.new(@english_message)
    message_contents = bc.convert_elements_to_full_braille
    File.write(ARGV[1], message_contents)
    puts "Created #{ARGV[1]} containing #{message_contents.length} characters"
  end
end


NightWriter.read_english_message
NightWriter.encode_file_to_braille
