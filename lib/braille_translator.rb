require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator

  def character_translator(char)
     BRAILLE_CHARACTERS[char]
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
end
