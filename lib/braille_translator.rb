require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator

  def character_translator(char)
     BRAILLE_CHARACTERS[char]
  end

  def number_translator(num)
     BRAILLE_NUMBERS[num]
  end
end
