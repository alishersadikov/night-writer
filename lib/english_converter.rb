require './lib/braille_alphabet'
require './lib/english_translator'

class EnglishConverter
  attr_reader :message,
              :braille_array

  def initialize(message)
    @message = message
    @braille_array = []
    @bt = EnglishTranslator.new
  end

  def get_line_1
    @line_1 = message.split("\n")[0].scan(/../) #=> ["0.", "0."]
  end

  def get_line_2
    @line_2 = message.split("\n")[1].scan(/../) #=> ["..", "0."]
  end

  def get_line_3
    @line_3 = message.split("\n")[2].scan(/../) #=> ["..", ".."]
  end

  def zip_lines
    @braille_array = get_line_1.zip(get_line_2, get_line_3)
  end

  def character_translator
    zip_lines.map do |element|
      @bt.inverted_char_translator(element)
    end
  end

  def number_translator
    zip_lines.map do |element|
      @bt.inverted_num_translator(element)
    end
  end

  def join_characters
    character_translator.join
  end

  def join_numbers
    number_translator.join
  end
end
