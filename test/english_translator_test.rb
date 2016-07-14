gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/english_translator'

class BrailleEnglishTest < Minitest::Test

  def test_it_translates_braille_text_into_english_elements
    bt = EnglishTranslator.new

    assert_equal "b", bt.inverted_char_translator(["0.","0.",".."])
    assert_equal "'", bt.inverted_char_translator(["..","..","0."])

    assert_equal "0", bt.inverted_num_translator([".0","00",".."])
  end
end
