# require_relative 'braille_alphabet'
require 'pry'

class BrailleConverter
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def triple
    "#{message}\n#{message}\n#{message}"
  end

  def array_converter
  end 

end
