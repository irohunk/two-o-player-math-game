require_relative 'game'

puts "Welcome to the Two-O-Player Math Game!"
print "Enter name for Player 1: "
player1_name = gets.chomp
print "Enter name for Player 2: "
player2_name = gets.chomp

game = Game.new(player1_name, player2_name)
game.start
