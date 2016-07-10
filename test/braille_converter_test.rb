gem 'minitest', '~> 5.9'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/braille_converter'

class BrailleConverterTest < Minitest::Test

  def test_if_message_is_tripled
    message = "Hello World"
    bc = BrailleConverter.new(message)

    assert_equal "Hello World", bc.message
    assert_equal "Hello World\nHello World\nHello World", bc.triple
  end
end
