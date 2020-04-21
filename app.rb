require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/human_player'

class App1
  p1 = Player.new('Josiane')
  p2 = Player.new('José')
  puts 'This is the players states :'
  puts "Let's go to the attack phase!"
  begin
    puts "-----------------------------"
    p1.show_state
    p2.show_state
    p1.attacks(p2)
    p2.attacks(p1) if p2.life_points > 0
  end while (p1.life_points > 0 && p2.life_points > 0)
end

class App2
  puts "--------------------------------------------------"
  puts "|Welcome to 'YOU WANT GO FURTHER, SEE IN RUBY' ! |"
  puts "|The object of this game is to be last survivor !|"
  puts "--------------------------------------------------"
  print 'Your name > '
  user = HumanPlayer.new(gets.chomp)
  player1 = Player.new('Josiane')
  player2 = Player.new('José')
  until ((user.life_points <=0) || (player1.life_points <= 0 && player2.life_points))
    puts "Your health state is : #{user.life_points} lifes"
    puts "What action do you want to perform ?"
    puts "  w - look for a better weapon"
    puts "  t - seek treatment"
    puts "attack a player in sight :"
    puts "  0 - Josiane has 10 points of life"
    puts "  1 - José has 10 life points"
  end
  binding.pry
end

# App1.new
App2.new