require_relative 'braille_alphabet'
require_relative 'braille_translator'
require 'pry'

class BrailleConverter
  attr_reader :message,
              :separated_message,
              #message_array
              :braille_characters
              #braille_array
              :braille_numbers
              # + braille_num_array

  def initialize(message)
    @message = message
    @separated_message = separate_characters(message)
    @braille_characters = []
    @braille_numbers = []
    @bt = BrailleTranslator.new
  end

  def duplicate_message
    "#{message}\n#{message}\n#{message}"
  end
  #triple

  def separate_characters(message)
    message.chars
  end
  #message_converter

  def braille_char_encoder
    @separated_message.map do |char|
      @bt.character_translator(char.downcase)
    end
  end
  #array_converter

  def braille_num_encoder
    @separated_message.map do |num|
      @bt.number_translator(num)
    end
  end

  def full_braille_encoder
    @separated_message.map.with_index do |char, num|
      if char == BRAILLE_CHARACTERS
        @bt.character_translator(char.downcase)
      else
        @bt.number_translator(num)
      end
    end
  end
