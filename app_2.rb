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
  bot1 = Player.new('Josiane')
  bot2 = Player.new('José')
  bots = []
  bots << bot1 << bot2
  until ((user.life_points <=0) || (bot1.life_points <= 0 && bot2.life_points <= 0))
    puts "--------------------------------"
    puts "Your health state is : #{user.life_points} lifes."
    puts "--------------------------------"
    
    # pause
    puts "Press enter to continue ..."
    gets

    # --- The user strategy ---
    puts "------------------------------------"
    puts "What action do you want to perform ?"
      begin
        puts "------------------------------------"
        puts "w - look for a better weapon."
        puts "t - seek treatment."
        puts "------------------------------------"
        puts "attack a player in sight :"
        puts " 0 - Josiane has #{bot1.life_points} points of life."
        puts " 1 - José has #{bot2.life_points} life points."
        puts "------------------------------------"
        print "What's your startegy > "
        strategy = gets.chomp
        puts "------------------------"
        puts "I didn't understand!" if (strategy != 'w' && strategy != 't' && strategy != '0' && strategy != '1')
      end while (strategy != 'w' && strategy != 't' && strategy != '0' && strategy != '1')
      
      # --- Execute strategy ---
      case strategy
      when 'w'
        user.search_new_weapon
      when 't'
        user.search_health_pack
      when '0'
        user.attacks(bot1)
      when '1'
        user.attacks(bot2)
      end
      
      # Pause
      puts "Press enter to continue ..."
      gets
      
      # --- The bots attack ---
      puts "-----------------------------"
      puts "The bots attacks! Watch out!"
      puts "-----------------------------"
    bots.each { |bot| bot.attacks(user) if bot.life_points > 0}
    # binding.pry
  end

  puts user.life_points

end
  
App.new