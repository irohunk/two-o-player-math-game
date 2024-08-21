class Turn
  attr_reader :current_player

  def initialize(player)
    @current_player = player
  end

  def end_turn
    # This would be handled by the Game class switching players.
  end
end
