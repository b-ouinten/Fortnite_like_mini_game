require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

class App
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

App.new