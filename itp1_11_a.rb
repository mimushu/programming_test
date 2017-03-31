class Dice
  def initialize(n, s, e, w, t, b)
    $north = n
    $south = s
    $east = e
    $west = w
    $top = t
    $bottom = b
  end

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

  def execute_orders(orders)
    orders.each do |order|
      if order == "N"
        move_north
      elsif order == "S"
        move_south
      elsif order == "E"
        move_east
      elsif order == "W"
        move_west
      else
        puts "error!"
      end
    end
  end
end

dice_number = gets.chomp.split.map(&:to_i)
t = dice_number[0]
s = dice_number[1]
e = dice_number[2]
w = dice_number[3]
n = dice_number[4]
b = dice_number[5]
input_orders = gets.chomp.to_s
orders = []
size = input_orders.size
for i in 0...size
  orders << input_orders[i]
end

dice = Dice.new(n, s, e, w, t, b)
dice.execute_orders(orders)
puts $top
