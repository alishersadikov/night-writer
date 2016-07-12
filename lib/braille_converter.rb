require_relative 'braille_alphabet'
require_relative 'braille_translator'
require 'pry'

class BrailleConverter
  attr_reader :message,
              :message_array,
              :braille_array

  def initialize(message)
    @message = message
    @message_array = message_converter(message)
    @braille_array = []
    @bt = BrailleTranslator.new
  end

  def triple
    "#{message}\n#{message}\n#{message}"
  end

  def message_converter(message)
# require "pry"; binding.pry
    message.chars
  end
  # require "pry"; binding.pry
  def array_converter
    @message_array.map do |character|
      @bt.character_translator(character)
    end
  end
end
