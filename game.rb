require_relative 'player'
require_relative 'question'
require_relative 'turn'

class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @current_player_index = 0
    @is_game_over = false
  end

  def start
    until @is_game_over
      current_player = @players[@current_player_index]
      turn = Turn.new(current_player)
      
      question = Question.new
      puts "#{current_player.name}: #{question.ask_question}"
      player_answer = gets.chomp

      if question.check_answer(player_answer)
        puts "Correct!"
      else
        puts "Wrong! You lose a life."
        current_player.lose_life
      end

      check_game_over
      switch_turns unless @is_game_over
    end

    declare_winner
  end

  private

  def switch_turns
    @current_player_index = (@current_player_index + 1) % @players.size
  end

  def check_game_over
    @is_game_over = @players.any? { |player| !player.is_alive? }
  end

  def declare_winner
    winner = @players.find { |player| player.is_alive? }
    if winner
      puts "#{winner.name} wins the game!"
    else
      puts "It's a draw!"
    end
  end
end
