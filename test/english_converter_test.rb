gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/english_converter'

class EnglishConverterTest < Minitest::Test
  def test_it_splits_message_into_lines
    message = "0.0.\n..0.\n...."
    ec = EnglishConverter.new(message)

    assert_equal ["0.", "0."], ec.get_line_1
    assert_equal ["..", "0."], ec.get_line_2
    assert_equal ["..", ".."], ec.get_line_3
  end

  def test_it_zips_lines
    message = "0.0.\n..0.\n...."
    ec = EnglishConverter.new(message)

    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], ec.zip_lines
  end

  def test_it_pulls_the_right_character
    message = "0.0.\n..0.\n...."
    ec = EnglishConverter.new(message)

    assert_equal ["a", "b"], ec.character_translator
  end

  def test_it_pulls_the_right_number
    message = "0.\n..\n.."
    ec = EnglishConverter.new(message)

    assert_equal ["1"], ec.number_translator
  end

  def test_it_joins_english_characters
    message = "0.0.\n..0.\n...."
    ec = EnglishConverter.new(message)

    assert_equal "ab", ec.join_characters
  end

  def test_it_joins_numbers
    message = "0.0.\n....\n...."
    ec = EnglishConverter.new(message)

    assert_equal "11", ec.join_numbers
  end
end
