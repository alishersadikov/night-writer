gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_translator'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

  def test_it_translates_characters_to_encoded_braille
    bt = BrailleTranslator.new

    assert_equal ["0.","..",".."], bt.character_translator("a")
    assert_equal ["..","00","0."], bt.character_translator("!")
    assert_equal ["..","..",".0"], bt.character_translator("shift")
  end

  def test_it_translates_numbers_to_encoded_braille
    bt = BrailleTranslator.new

    assert_equal "b", bt.inverted_char_translator(["0.","0.",".."])
    assert_equal "'", bt.inverted_char_translator(["..","..","0."])
    assert_equal "0", bt.inverted_num_translator([".0","00",".."])
  end

end
