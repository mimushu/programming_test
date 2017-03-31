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
  end

  def find_south_by_ne(order_n, order_e)
    "e = #{order_e}"
    loop do
      tmp = execute_orders(["N", "S", "E", "W"].sample)
      if $top == order_n && $south == order_e
        break
      end
    end
    return $east
  end
end

dice_number = gets.chomp.split.map(&:to_i)
t = dice_number[0]
s = dice_number[1]
e = dice_number[2]
w = dice_number[3]
n = dice_number[4]
b = dice_number[5]
num = gets.chomp.to_i
answers = []
num.times do
  input_ne = gets.chomp.split.map(&:to_i)
  order_n = input_ne[0]
  order_e = input_ne[1]
  dice = Dice.new(n, s, e, w, t, b)
  answers << dice.find_south_by_ne(order_n, order_e)
end
answers.each do |i|
  puts i
end
