class HumanPlayer < Player
  attr_accessor :weapon_level
  
  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end
  
  def show_state
    puts "#{@name} has #{@life_points} points of life and a leval #{@weapon_level} weapon." 
  end

  def compute_domage
    rand(1..6) * @weapon_level
  end

  def search_new_weapon
    new_weapon_level = rand(1..6)
    puts "You found a level #{new_weapon_level} weapon."
    if new_weapon_level > @weapon_level
      puts "Youhou! it's better than your current weapon."
      @weapon_level = new_weapon_level
    else
      puts ";o) It isn't better than yours!"
    end
  end

  def search_health_pack
    luck = rand(1..6)
    case luck
    when 1
      puts "Oups! You didn't find anything."
    when 2, 3, 4, 5
      puts "Bravo, you found a +50 points pack."
      @life_points += 50
    else
      puts "Waow, you found a +80 points pack."
      @life_points += 80
    end
  end
end