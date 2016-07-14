gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_alphabet'
require './lib/braille_translator'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

  def test_it_translates_english_elements_into_braille
    bt = BrailleTranslator.new

    assert_equal ["0.","..",".."], bt.character_translator("a")
    assert_equal ["..","00","0."], bt.character_translator("!")

    assert_equal ["00", "00", ".."], bt.number_translator("7")
  end
end
