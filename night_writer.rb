require './lib/braille_converter'

class NightWriter
  attr_reader :content

  def self.read_contents
    @english_content = File.read(ARGV[0])
  end

  def self.encode_file_to_braille
    bc = BrailleConverter.new(@english_content)
    message_contents = bc.convert_to_full_braille
    File.write(ARGV[1], message_contents)
    puts "Created #{ARGV[1]} containing #{message_contents.length} characters."
  end
end


NightWriter.read_contents
NightWriter.encode_file_to_braille
