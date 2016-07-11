gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/braille_converter'
require '../lib/braille_alphabet'
require '../lib/braille_translator'
require 'pry'

class BrailleTranslatorTest < Minitest::Test

  def test_it_translates_key_letter_to_braille_value
    character = "a"
    bt = BrailleTranslator.new(character)

    assert_equal "a", ba.character
    assert_equal ["0.","..",".."], bt.character_translator
  end

def test_if_a_word_is_translated
  message = "hello"
  bc = BrailleConverter.new(message)

  assert_equal "hello", bc.message
  assert_equal "", bc.
end

end
