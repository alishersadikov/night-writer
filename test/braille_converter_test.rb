sgem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_converter'

class BrailleConverterTest < Minitest::Test

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

  def test_it_converts_a_word_into_encoded_braille_text
    word = "encryption"
    bc = BrailleConverter.new(word)

    assert_equal [["0.", ".0", ".."], ["00", "0.", ".0"], ["00", "..", ".."], ["0.", "00", "0."], ["00", ".0", "00"], ["00", "0.", "0."], [".0", "00", "0."], [".0", "0.", ".."], ["0.", ".0", "0."], ["00", "0.", ".0"]], bc.encode_braille_elements
  end

  def test_it_converts_a_phrase_into_encoded_braille_text
    phrase = "NIGHT writer!!!"
    bc = BrailleConverter.new(phrase)

    assert_equal [["..00", "...0", ".00."], ["...0", "..0.", ".0.."], ["..00", "..00", ".0.."], ["..0.", "..00", ".0.."], ["...0", "..00", ".00."], ["..", "..", ".."], [".0", "00", "0."], ["0.", "00", "0."], [".0", "0.", ".."], [".0", "00", "0."], ["0.", ".0", ".."], ["0.", "00", "0."], ["..", "00", "0."], ["..", "00", "0."], ["..", "00", "0."]], bc.encode_braille_elements
  end

  def test_it_converts_numbers_into_encoded_braille_text
    numbers = "#555"
    bc = BrailleConverter.new(numbers)

    assert_equal [[".0", ".0", "00"], ["0.", ".0", ".."], ["0.", ".0", ".."], ["0.", ".0", ".."]], bc.encode_braille_elements
  end

  def test_it_converts_a_full_message_into_encoded_braille_text

    message = "We are #1.ALISHER and #2.KINAN !!!"
    bc = BrailleConverter.new(message)

    assert_equal [["...0", "..00", ".0.0"], ["0.", ".0", ".."], ["..", "..", ".."], ["0.", "..", ".."], ["0.", "00", "0."], ["0.", ".0", ".."], ["..", "..", ".."], [".0", ".0", "00"], ["0.", "..", ".."], ["..", "00", ".0"], ["..0.", "....", ".0.."], ["..0.", "..0.", ".00."], ["...0", "..0.", ".0.."], ["...0", "..0.", ".00."], ["..0.", "..00", ".0.."], ["..0.", "...0", ".0.."], ["..0.", "..00", ".00."], ["..", "..", ".."], ["0.", "..", ".."], ["00", "0.", ".0"], ["00", ".0", ".."], ["..", "..", ".."], [".0", ".0", "00"], ["0.", "0.", ".."], ["..", "00", ".0"], ["..0.", "....", ".00."], ["...0", "..0.", ".0.."], ["..00", "...0", ".00."], ["..0.", "....", ".0.."], ["..00", "...0", ".00."], ["..", "..", ".."], ["..", "00", "0."], ["..", "00", "0."], ["..", "00", "0."]], bc.encode_braille_elements
  end

  def test_it_transposes_a_word_of_encoded_braille_text
    word = "world"
    bc = BrailleConverter.new(word)

    assert_equal [[".0", "0.", "0.", "0.", "00"], ["00", ".0", "00", "0.", ".0"], ["0.", "0.", "0.", "0.", ".."]], bc.transpose_braille_elements
  end

  def test_it_transposes_a_phrase_of_encoded_braille_text
    phrase = "HI, world!"
    bc = BrailleConverter.new(phrase)

    assert_equal [["..0.", "...0", "..", "..", ".0", "0.", "0.", "0.", "00", ".."], ["..00", "..0.", "0.", "..", "00", ".0", "00", "0.", ".0", "00"], [".0..", ".0..", "..", "..", "0.", "0.", "0.", "0.", "..", "0."]], bc.transpose_braille_elements
  end

  def test_it_transposes_a_number_of_encoded_braille_text
    number = "#1606#"
    bc = BrailleConverter.new(number)

    assert_equal [[".0", "0.", "00", ".0", "00", ".0"], [".0", "..", "0.", "00", "0.", ".0"], ["00", "..", "..", "..", "..", "00"]], bc.transpose_braille_elements
  end

  def test_it_joins_a_word_of_encoded_braille_text
    word = "dragon"
    bc = BrailleConverter.new(word)

    assert_equal ["000.0.000.00", ".000..00.00.", "..0.....0..0"], bc.join_braille_elements
  end

  def test_it_joins_a_phrase_of_encoded_braille_text
    phrase = "Dragons breathe FIRE!"
    bc = BrailleConverter.new(phrase)

    assert_equal ["..000.0.000.00.0..0.0.0.0..00.0.....00...0..0...0...", "...000..00.00.0...0.00.0..0000.0....0...0...00...000", ".0..0.....0..00.....0.....0........0...0...00..0..0."], bc.join_braille_elements
  end

  def test_it_joins_a_numbers_of_encoded_braille_text
    numbers = "#1100"
    bc = BrailleConverter.new(numbers)

    assert_equal [".00.0..0.0", ".0....0000", "00........"], bc.join_braille_elements
  end

  def test_it_encodes_a_full_message_with_all_elements_to_braille
    message = "Amazing World"
    bc = BrailleConverter.new(message)

    assert_equal "..0.000.0..00000.....00.0.0.00\n.........00.0.00....00.0000..0\n.0..0...00...0.....0.00.0.0...", bc.convert_elements_to_full_braille

    message = "HELLO world!!!"
    bc = BrailleConverter.new(message)

    assert_equal "..0...0...0...0...0....00.0.0.00......\n..00...0..0...0....0..00.0000..0000000\n.0...0...00..00..00...0.0.0.0...0.0.0.", bc.convert_elements_to_full_braille

    message = "#111#"
    bc = BrailleConverter.new(message)

    assert_equal ".00.0.0..0\n.0.......0\n00......00", bc.convert_elements_to_full_braille
  end
end
