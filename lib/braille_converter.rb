require './lib/braille_alphabet'
require './lib/braille_translator'

class BrailleConverter
  attr_reader :message,
              :separated_message,
              :braille_characters,
              :input_nums

  def initialize(message)
    @message = message
    @separated_message = separate_characters(message)
    @braille_characters = []
    @braille_numbers = []
    @bt = BrailleTranslator.new
    @input_nums = false
  end

  def separate_characters(message)
    message.chars
  end

  def braille_number_switch(element)
    if element == element.to_i && @input_nums == false
      @input_nums = true
      [".0",".0","00"] + @bt.number_translator(element)
    else
      @bt.number_translator(element)
    end
  end

  def encode_braille_elements
      @separated_message.map do |element|
      if /[[:upper:]]/.match(element)
        @input_nums = false
        @bt.capital_translator(element)
      elsif /[0-9]/.match(element)
        braille_number_switch(element)
      else
        @input_nums = false
        @bt.character_translator(element)
      end
    end
  end

  def transpose_braille_elements
    encode_braille_elements.compact.transpose
  end

  def join_braille_elements
    transpose_braille_elements.map do |element|
      element.join
    end
  end

  def convert_elements_to_full_braille
    join_braille_elements.map { |position| "#{position}"}.join("\n")
  end

  # def split_braille_text
  #   convert_elements_to_full_braille.split("\n")
  # end
  #
  # def measure_row_length
  #   split_braille_text.first.length
  # end
  #
  # def limit_braille_line_length
  #   convert_elements_to_full_braille.each
  #     if measure_row_length > 160
  #       require "pry"; binding.pry
  #       
  #       end
  #   end
  # end
end
