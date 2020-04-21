class Game
  attr_accessor :user, :bots
  
  def initialize(user_name)
    @user = HumanPlayer.new(user_name)
    @bots = []
    4.times { |number| @bots << Player.new("bot0#{number}") }
  end
  
  def is_still_ongoing?
    @user.life_points > 0 && @bots.count > 0
  end
  
  def show_players
    puts "----------------------------------"
    puts "Your health state is : #{@user.life_points} points."
    puts "You have #{@bots.count} bots left to fight!"
    puts "----------------------------------"
  end
  
  def menu
    puts "------------------------------------"
    puts "What action do you want to perform ?"
      puts "------------------------------------"
      puts "w - look for a better weapon."
      puts "t - seek treatment."
      puts "------------------------------------"
      puts "attack a player in sight :"
      # --- Show remaining bots ---
      @bots.each_index { |bot_number|
      puts " #{bot_number} - #{@bots[bot_number].name} has #{@bots[bot_number].life_points} points of life."
    }
    puts "Your strategy ? > "
    puts "------------------------------------"
  end
  
  def menu_choise(strategy_choise)
    case strategy_choise
    when 'w'
      @user.search_new_weapon
    when 't'
      @user.search_health_pack
    else
      @bots.each_index { |rank| 
        bot_attacked = @bots[rank]
        if rank.to_s == strategy_choise 
          @user.attacks(bot_attacked) 
          kill_bot(bot_attacked) if bot_attacked.life_points <= 0
        end
      }
    end
  end

  def bots_attack
    if (@bots.count > 0)
      puts "-----------------------------"
      puts "The bots attack! Watch out!"
      puts "-----------------------------"
      @bots.each { |bot| bot.attacks(@user) }
    else
      puts "-------------------------------"
      puts "There is no bots left to fight!"
      puts "-------------------------------"
    end
  end

  def finished
    if (@user.life_points > 0)
      puts "----------------"
      puts "BRAVO, you WON!"
      puts "----------------"
    else
      puts "----------------"
      puts "You LOSE!!"
      puts "----------------"
    end
  
  end

  private
  def kill_bot(bot)
    @bots.delete(bot)
  end
end