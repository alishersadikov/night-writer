gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_translator'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

  def test_if_one_character_is_translated
    bt = BrailleTranslator.new

    assert_equal ["0.","..",".."], bt.character_translator("a")
    assert_equal ["..","00","0."], bt.character_translator("!")
    assert_equal ["..","..",".0"], bt.character_translator("shift")
  end

  def test_if_one_number_is_translated
    bt = BrailleTranslator.new

    assert_equal "b", bt.inverted_char_translator(["0.","0.",".."])
    assert_equal "'", bt.inverted_char_translator(["..","..","0."])
    assert_equal "0", bt.inverted_num_translator([".0","00",".."])
  end

  # def test_it_

  # assert_equal ["0.", "0."], bt.("he")


  # def test_it_translates_a_set_of_characters
  #   word = "the"
  #   bt = BrailleTranslator.new(word)
  # end

end
