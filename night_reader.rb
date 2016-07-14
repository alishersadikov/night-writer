require './lib/english_converter'

class NightReader
  attr_reader :braille_content

  def self.read_contents
    @braille_content = File.read(ARGV[0])
  end

  def self.decrypt_braille_to_english
    ec = EnglishConverter.new(@braille_content)
    message_contents = ec.join_characters
    File.write(ARGV[1], message_contents)
    puts "Created #{ARGV[0]} containing #{message_contents.length} characters."
  end
end

NightReader.read_contents
NightReader.decrypt_braille_to_english
