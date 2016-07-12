gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_it_triples_the_message_on_new_lines
    message = "Hello World"
    bc = BrailleConverter.new(message)

    assert_equal "Hello World", bc.message
    assert_equal "Hello World\nHello World\nHello World", bc.triple
    # binding.pry
  end

  def test_it_converts_a_message_to_an_array_of_individual_characters
    word = "hello"
    bc = BrailleConverter.new(word)

    assert_equal ["h","e","l","l","o"], bc.message_converter(word)
    # assert_equal "", bc.
  end

  def test_it_converts_another_message_to_an_array_of_individual_characters
    phrase = "world!"
    bc = BrailleConverter.new(phrase)

    assert_equal ["w", "o", "r", "l", "d", "!"], bc.message_converter(phrase)
  end

  def test_converts_a_phrases_to_an_array
    phrase = "hello world!"
    bc = BrailleConverter.new(phrase)

    assert_equal ["h","e","l","l","o"," ","w","o","r","l","d","!"], bc.message_converter(phrase)
    # require "pry"; binding.pry
  end

  def test_it_converts_message_array_into_braille_array
    phrase = "world!"
    bc = BrailleConverter.new(phrase)

    assert_equal [[".0","00","0."],["0.",".0","0."],["0.","00","0."],["0.","0.","0."],["00",".0",".."],["..","00","0."]], bc.array_converter
  end

  def test_it_transposes_the_braille_array
    phrase = "wo"
    bc = BrailleConverter.new(phrase)

    assert_equal [[".0","0."],["00",".0"],["0.","0."]], bc.transpose_array
  end

  def test_if_transposed_are_joined
    phrase = "wo"
    bc = BrailleConverter.new(phrase)

    assert_equal [".00.", "00.0", "0.0."], bc.join_array
  end

  def test_if_message_translated_to_braille
    phrase = "wo"
    bc = BrailleConverter.new(phrase)

    assert_equal ".00.\n00.0\n0.0.", bc.convert_to_braille

  end

end
