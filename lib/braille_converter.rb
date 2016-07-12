require_relative 'braille_alphabet'
require_relative 'braille_translator'
require 'pry'

class BrailleConverter
  attr_reader :message,
              :separated_message,
              #message_array
              :braille_characters
              #braille_array
              # :braille_numbers
              # # + braille_num_array

  def initialize(message)
    @message = message
    @separated_message = separate_characters(message)
    @braille_characters = []
    @braille_numbers = []
    @bt = BrailleTranslator.new
  end

  def triple_message
    "#{message}\n#{message}\n#{message}"
  end
  #triple

  def separate_characters(message)
    message.chars
  end
  #message_converter

  def encode_braille_characters
    @separated_message.map do |char|
      @bt.character_translator(char)
    #   if char.downcase
    #     @braille_characters << @bt.character_translator(char)
    #     @braille_characters.last
     #
    #   elsif char.upcase
    #     @braille_characters << @bt.character_translator("shift")
    #     @braille_characters << @bt.character_translator(char)
    #     @braille_characters.last
     #
    #     braille << alphabet[:shift] unless char == char.downcase
    #  braille << alphabet[char.downcase]
      # end
    end
  end

  #array_converter

  def encode_braille_numbers
    @separated_message.map do |num|
      @bt.number_translator(num)
    end
  end

  # def full_braille_encoder
  #   @separated_message.map do |element|
  #     if element == BRAILLE_CHARACTERS
  #     @bt.character_translator(element.downcase)
  #     unless element == BRAILLE_NUMBERS
  #     @bt.number_translator(element)
  #     end
  #   end
  # end
end
