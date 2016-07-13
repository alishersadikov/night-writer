require './lib/braille_alphabet'
require 'pry'

class EnglishTranslator

  def inverted_char_translator(braille_char)
    BRAILLE_CHAR_INVERTED[braille_char]
  end

  def inverted_num_translator(braille_num)
    BRAILLE_NUM_INVERTED[braille_num]
  end
end
