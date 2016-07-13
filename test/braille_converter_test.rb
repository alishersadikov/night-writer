gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_it_triples_a_message_each_duplicate_on_new_lines
    message = "Hello World!"
    bc = BrailleConverter.new(message)

    assert_equal "Hello World!", bc.message
    assert_equal "Hello World!\nHello World!\nHello World!", bc.triple_message
  end

  def test_it_converts_a_word_into_individual_characters
    word = "hello"
    bc = BrailleConverter.new(word)

    assert_equal ["h", "e", "l", "l", "o"], bc.separate_characters(word)
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

    assert_equal [[".0", "00", "0."], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."],["00", ".0", ".."], ["..", "00", "0."]], bc.encode_braille_characters
  end

  def test_it_converts_a_phrase_into_encoded_braille_text
    phrase = "HI, world!"
    bc = BrailleConverter.new(phrase)

    assert_equal [["0.", "00", ".."], [".0", "0.", ".."], ["..", "0.", ".."], ["..", "..", ".."], [".0", "00", "0."], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."], ["..", "00", "0."]], bc.encode_braille_characters
  end

  def test_it_converts_numbers_into_encoded_braille_text
    numbers = "#1606#"
    bc = BrailleConverter.new(numbers)

    assert_equal [[".0", ".0", "00"], ["0.", "..", ".."], ["00", "0.", ".."], [".0", "00", ".."], ["00", "0.", ".."], [".0", ".0", "00"]], bc.encode_braille_numbers
  end
#_____________________________________
  def test_it_transposes_a_word_of_encoded_braille_text
    word = "world"
    bc = BrailleConverter.new(word)

    assert_equal [[".0", "0.", "0.", "0.", "00"], ["00", ".0", "00", "0.", ".0"], ["0.", "0.", "0.", "0.", ".."]], bc.transpose_braille_characters
  end
#___________________________________
  def test_it_joins_a_phrase_of_encoded_braille_text
    phrase = "Hello! World"
    bc = BrailleConverter.new(phrase)

    assert_equal ["0.0.0.0.0......00.0.0.00", "00.00.0..000..00.0000..0", "....0.0.0.0...0.0.0.0..."], bc.join_braille_characters
  end
#_____________________________________
  def test_it_fully_encodes_a_word_to_braille
    word = "world"
    bc = BrailleConverter.new(word)


    assert_equal ".00.0.0.00\n00.0000..0\n0.0.0.0...", bc.convert_to_full_braille

    phrase = "hello world!!!"
    bc = BrailleConverter.new(phrase)

    assert_equal "0.0.0.0.0....00.0.0.00......\n00.00.0..0..00.0000..0000000\n....0.0.0...0.0.0.0...0.0.0.", bc.convert_to_full_braille
  end

  #Translate with capital letters:
  def test_if_message_translated_to_braille
    skip
    phrase = "HELLO"
    bc = BrailleConverter.new(phrase)

    assert_equal "0.0.0.0.0....00.0.0.00......\n00.00.0..0..00.0000..0000000\n....0.0.0...0.0.0.0...0.0.0.", bc.convert_to_full_braille
  end

  #Translate full message into braille:
  def test_it_converts_a_full_message_into_encoded_braille_text
    skip
    message = "We are #1.ALISHER and #2.KINAN !!!"
    bc = BrailleConverter.new(message)

    assert_equal [[]], bc.encode_braille_characters || bc.encode_braille_numbers
  end

end
