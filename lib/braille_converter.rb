require './lib/braille_alphabet'
require_relative 'braille_translator'

class BrailleConverter
  attr_reader :message,
              :separated_message,
              :braille_characters

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
    @separated_message.compact.map do |char|
      @bt.character_translator(char.downcase)
    end
  end
  #array_converter

  def encode_braille_numbers
    @separated_message.map do |num|
      @bt.number_translator(num)
    end
  end

  # def encode_braille_char_and_num
  #   @separated_message.map.with_index do |char, num|
  #     if char == BRAILLE_CHARACTERS
  #       @bt.character_translator(char.downcase)
  #     else
  #       @bt.number_translator(num)
  #     end
  #   end
  # end

  #transpose_array
  def transpose_braille_characters
    encode_braille_characters.compact.transpose
  end
#join_array
  def join_braille_characters
    transpose_braille_characters.map do |element|
      element.join
    end
  end

  def convert_to_full_braille
    join_braille_characters.map { |position| "#{position}"}.join("\n")

  end



end
