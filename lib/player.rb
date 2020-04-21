class Player
  attr_accessor :name, :life_points
  
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} has #{@life_points} points of life" 
  end

  def gets_domage(points)
    @life_points -= points
    if @life_points <= 0
      @life_points = 0
      puts "#{@name} was killed"
    end
  end

  def compute_domage
    rand(1..6)
  end

  def attacks(opponent)
    puts "#{@name} attacks #{opponent.name}"
    domage = compute_domage
    puts "It deals #{domage} domage to it!"
    opponent.gets_domage(domage)
  end

end