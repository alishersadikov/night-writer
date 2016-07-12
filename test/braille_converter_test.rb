gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_converter'
require './lib/braille_alphabet'
require 'pry'

class BrailleConverterTest < Minitest::Test

  def test_it_triples_a_message_each_duplicate_on_new_lines
    message = "Hello World!"
    bc = BrailleConverter.new(message)

    assert_equal "Hello World!", bc.message
    assert_equal "Hello World!\nHello World!\nHello World!", bc.triple_message
    # binding.pry
  end

  def test_it_converts_a_word_into_individual_characters
    word = "hello"
    bc = BrailleConverter.new(word)

    assert_equal ["h", "e", "l", "l", "o"], bc.separate_characters(word)
    # assert_equal "", bc.
  end

  def test_it_converts_a_phrase_into_individual_characters
    phrase = "HELLO world!?"
    bc = BrailleConverter.new(phrase)

    assert_equal ["H", "E", "L", "L", "O", " ", "w", "o", "r", "l", "d", "!", "?"], bc.separate_characters(phrase)
  end

  def test_it_converts_numbers_into_single_digits
    numbers = "#1606#"
    bc = BrailleConverter.new(numbers)

    assert_equal ["#", "1", "6", "0", "6", "#"], bc.separate_characters(numbers)
  end

  def test_it_converts_words_into_encoded_braille_text
    word = "world!"
    bc = BrailleConverter.new(word)

    assert_equal [[".0", "00", "0."], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."],["00", ".0", ".."], ["..", "00", "0."]], bc.encode_braille_character
  end

  def test_it_converts_a_phrase_into_encoded_braille_text
    phrase = "HI, world!"
    bc = BrailleConverter.new(phrase)

    assert_equal [["0.", "00", ".."], [".0", "0.", ".."], ["..", "0.", ".."], ["..", "..", ".."], [".0", "00", "0."], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."], ["..", "00", "0."]], bc.encode_braille_character
  end

  def test_it_converts_numbers_into_encoded_braille_text
    numbers = "#1606#"
    bc = BrailleConverter.new(numbers)

    assert_equal [[".0", ".0", "00"], ["0.", "..", ".."], ["00", "0.", ".."], [".0", "00", ".."], ["00", "0.", ".."], [".0", ".0", "00"]], bc.braille_num_encoder
  end

  # def test_it_converts_a_full_message_into_encoded_braille_text
  #   message = "We are #1.ALISHER and #2.KINAN !!!"
  #   bc = BrailleConverter.new(message)
  #
  #   assert_equal [[]], bc.full_braille_encoder
  # end
end
