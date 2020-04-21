class Game
  attr_accessor :user, :bots_in_sight, :bots_left, :bot_index
  
  def initialize(user_name)
    @user = HumanPlayer.new(user_name)
    @bots_left = 10
    @bots_in_sight = []
    @bot_index = 0
  end
  
  def is_still_ongoing?
    @user.life_points > 0 && (@bots_left > 0 || @bots_in_sight.count > 0)
  end
  
  def show_players
    puts "---------------------------------------"
    puts "Your health state is : #{@user.life_points} points."
    puts "You have #{@bots_in_sight.count} bots in sight left to fight!"
    puts "---------------------------------------"
  end
  
  def menu
    puts "------------------------------------"
    puts "What action do you want to perform ?"
    puts "------------------------------------"
    puts "w - look for a better weapon."
    puts "t - seek treatment."
    puts "------------------------------------"
    puts "attack a player in sight :" if @bots_in_sight.count > 0
      
    # --- Show remaining bots_in_sight ---
    @bots_in_sight.each_index { |bot_number|
      puts " #{bot_number} - #{@bots_in_sight[bot_number].name} has #{@bots_in_sight[bot_number].life_points} points of life."
    }
    
    # Control user type ---
    begin
      puts "------------------------------------"
      puts "Your strategy ? > "
      strategy = gets.chomp
      puts "Wrong answer! i didn't understand." if (strategy != 'w' && strategy != 't' && (strategy.to_i < 0 || strategy.to_i > @bots_in_sight.count))
    end while (strategy != 'w' && strategy != 't' && (strategy.to_i < 0 || strategy.to_i > @bots_in_sight.count))
    puts "------------------------------------"
    strategy
  end
  
  def menu_choise(strategy_choise)
    case strategy_choise
    when 'w'
      @user.search_new_weapon
    when 't'
      @user.search_health_pack
    else
      @bots_in_sight.each_index { |rank| 
        bot_attacked = @bots_in_sight[rank]
        if rank.to_s == strategy_choise 
          @user.attacks(bot_attacked) 
          kill_bot(bot_attacked) if bot_attacked.life_points <= 0
        end
      }
    end
  end

  def new_bots_in_sight
    if @bots_left > 0
      hazard = rand(1..6)
      if (hazard == 1)
        puts "No new bots in sight! You are lucky."
      elsif (hazard >= 2 && hazard <= 4)
        @bots_in_sight << Bot.new("bot" + "%02d" % "#{bot_index}")
        @bot_index += 1
        puts "There is a new bot in sight! Be careful, raise number to #{@bots_in_sight.count}."
        # --- Decrease remaining bots_in_sight number ---
        @bots_left -= 1
      else
        @bots_in_sight << Bot.new("bot" + "%02d" % "#{bot_index}")
        @bot_index += 1
        @bots_in_sight << Bot.new("bot" + "%02d" % "#{bot_index}")
        @bot_index += 1
        puts "There is a two new bots in sight! Make mind, raise number to #{@bots_in_sight.count}."
        # --- Decrease remaining bots_in_sight number ---
        @bots_left -= 2
      end
    else
      puts "Bots all in sight!"
    end
  end

  def bots_attack
    if (@bots_in_sight.count > 0)
      puts "------------------------------------"
      puts "The bots in sight attack! Watch out!"
      puts "------------------------------------"
      @bots_in_sight.each { |bot| bot.attacks(@user) }
    else
      puts "----------------------------------------"
      puts "There is no bots in sight left to fight!"
      puts "----------------------------------------"
    end
  end

  def finished
    if (@user.life_points > 0)
      puts "----------------"
      puts "BRAVO, you WON!"
      puts "----------------"
    else
      puts "----------------"
      puts "You LOSE!!!"
      puts "----------------"
    end
  
  end

  private
  def kill_bot(bot)
    @bots_in_sight.delete(bot)
  end
end