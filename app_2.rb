require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/human_player'

class App
  puts "--------------------------------------------------"
  puts "|Welcome to 'YOU WANT GO FURTHER, SEE IN RUBY' ! |"
  puts "|The object of this game is to be last survivor !|"
  puts "--------------------------------------------------"
  print 'Your name > '
  user = HumanPlayer.new(gets.chomp)
  player1 = Player.new('Josiane')
  player2 = Player.new('José')
  enemies << player1 << player2
  until ((user.life_points <=0) || (player1.life_points <= 0 && player2.life_points))
    puts "Your health state is : #{user.life_points} lifes"
    puts "What action do you want to perform ?"
      puts "  w - look for a better weapon"
      puts "  t - seek treatment"
      puts "attack a player in sight :"
      puts "  0 - Josiane has #{player1.show_state} points of life"
      puts "  1 - José has #{player2.show_state} life points"
    end
    binding.pry
end

App.new