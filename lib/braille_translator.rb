require './lib/braille_alphabet'
require 'pry'

class BrailleTranslator

  def character_translator(char)
     BRAILLE_CHARACTERS[char]
  end

  def capital_translator(caps)
    BRAILLE_CAPITALS[caps]
  end

  def number_translator(num)
     BRAILLE_NUMBERS[num]
  end
end
