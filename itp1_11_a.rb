class Dice

  def initialize(dice_numbers)
    $top = dice_numbers[0]
    $back = dice_numbers[1]
    $right = dice_numbers[2]
    $left = dice_numbers[3]
    $front = dice_numbers[4]
    $bottom = dice_numbers[5]
  end

  def execute_orders(orders)
    length = orders.length
    for i in 0...length
      if orders[i] == "N"
        move_north
      elsif orders[i] == "S"
        move_south
      elsif orders[i] == "E"
        move_east
      elsif orders[i] == "W"
        move_west
      else
        puts "error!"
      end
    end

    private
    def move_north
      north = $north
      south = $south
      top = $top
      bottom = $bottom
      $north = top
      $top = south
      $bottom = north
      $south = bottom
    end

    def move_south
      north = $north
      south = $south
      top = $top
      bottom = $bottom
      $south = top
      $bottom = south
      $north = bottom
      $top = north
    end

    def move_east
      top = $top
      bottom = $bottom
      east = $east
      west = $west
      $east = top
      $bottom = east
      $west = bottom
      $top = west
    end

    def move_west
      top = $top
      bottom = $bottom
      east = $east
      west = $west
      $west = top
      $bottom = west
      $east = bottom
      $top = east
    end
  end


dice_numbers = gets.chomp.split.map(&:to_i)
input_orders = gets.chomp.to_s
orders = []
size = input_orders.size
for i in 0...size
  orders << input_orders[i]
end

dice = Dice.new(dice_numbers)
dice.execute_orders(orders)
puts $top
