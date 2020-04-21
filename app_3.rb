require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/bot'
require_relative 'lib/game'

class App
  puts "--------------------------------------------------"
  puts "|Welcome to 'IF YOU WANT SURVIVE, THINK IN RUBY'!|"
  puts "|The object of this game is to be last survivor! |"
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

    # --- Show strategy menu ---
    # --- Define the user strategy ---
    # --- Execute strategy ---
    my_game.menu_choise(my_game.menu)
    
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