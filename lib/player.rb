class Player

  attr_reader :token

  def initialize(token)
    @token = token
  end

  class Human < Player

  end

end
