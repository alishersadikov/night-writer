require_relative 'braille_alphabet'
require 'pry'

class BrailleTranslator
  attr_reader :character,
              :braille_alphabet

  def initialize(character)
    @character = character
    @braille_alphabet = BrailleAlphabet.new
  end

#   def braille_alphabet
#     BrailleAlphabet.new
#
# end

  def character_translator
     @braille_alphabet.letters[character]
  end
end
