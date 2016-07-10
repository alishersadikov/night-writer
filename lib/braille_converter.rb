class BrailleConverter
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def triple
    "#{message}\n#{message}\n#{message}"
  end
end
