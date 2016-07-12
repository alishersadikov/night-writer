require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator
  attr_reader :message_array

  def initialize
    @message_array = []
  end

  def translator_chooser(char)
    if BRAILLE_CHARACTERS[char]

  end


  def character_translator(char)
     BRAILLE_CHARACTERS[char]
  end

  def special_translator(spec)
    BRAILLE_SPECIAL[spec]
  end

  def number_translator(num)
     BRAILLE_NUMBERS[num]
  end

  def inverted_char_translator(braille_char)
    BRAILLE_CHAR_INVERTED[braille_char]
  end

  def inverted_num_translator(braille_num)
    BRAILLE_NUM_INVERTED[braille_num]
  end

  # def string_translator(string)
  #   message_array << string.each do |string|
  #   string[0]


  end


end
