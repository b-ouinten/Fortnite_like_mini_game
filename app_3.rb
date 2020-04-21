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
  my_game = Game.new(gets.chomp)

  # --- Start the game ---
  while (my_game.is_still_ongoing?)
    my_game.show_players
    
    # pause
    puts "Press enter to continue ..."
    gets
    
    # --- Add a new bots ---
    my_game.new_bots_in_sight
    
    # pause
    puts "Press enter to continue ..."
    gets

    # --- Define the user strategy ---
    # --- Show strategy menu ---
    my_game.menu

    # --- Execute strategy ---
    my_game.menu_choise(gets.chomp)
    
    # Pause
    puts "Press enter to continue ..."
    gets
    
    # --- The bots attack ---
    my_game.bots_attack

  end

  # --- Game finished ---
  my_game.finished
end
  
App.new