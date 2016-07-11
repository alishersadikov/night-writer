gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_converter'
require './lib/braille_alphabet'
require 'pry'

class BrailleConverterTest < Minitest::Test

  def test_it_triples_the_message_on_new_lines
    message = "Hello World"
    bc = BrailleConverter.new(message)

    assert_equal "Hello World", bc.message
    assert_equal "Hello World\nHello World\nHello World", bc.triple
    # binding.pry
  end

  def test_if_a_word_is_converted_to_an_array
    word = "hello"
    bc = BrailleConverter.new(word)

    assert_equal ["h","e","l","l","o"], bc.array_converter
    assert_equal "", bc.
  end  #
end

  # def test_if_a_phrases_is_converted_to_an_array
  #   phrase = "hello world!"
  #   bc = BrailleConverter.new(phrase)
  #
  #   assert_equal ["h","e","l","l","o"," ","w","o","r","l","d","!"],
  # end

  # def test_it_puts_hash_values_on_three_new_lines
  # end
