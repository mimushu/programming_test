class Dice
  def initialize(f, ba, r, l, t, bo)
    $front = f
    $back = ba
    $right = r
    $left = l
    $top = t
    $bottom = bo
  end

  def move_front
    front = $front
    back = $back
    top = $top
    bottom = $bottom
    $front = top
    $top = back
    $bottom = front
    $back = bottom
  end

  def move_back
    front = $front
    back = $back
    top = $top
    bottom = $bottom
    $back = top
    $bottom = back
    $front = bottom
    $top = front
  end

  def move_right
    top = $top
    bottom = $bottom
    right = $right
    left = $left
    $right = top
    $bottom = right
    $left = bottom
    $top = left
  end

  def move_left
    top = $top
    bottom = $bottom
    right = $right
    left = $left
    $left = top
    $bottom = left
    $right = bottom
    $top = right
  end

  def execute_orders(orders)
    orders.each do |order|
      if order == "N"
        move_front
      elsif order == "S"
        move_back
      elsif order == "E"
        move_right
      elsif order == "W"
        move_left
      else
        puts "error!"
      end
    end
  end
end

dice_number = gets.chomp.split.map(&:to_i)
t = dice_number[0]
ba = dice_number[1]
r = dice_number[2]
l = dice_number[3]
f = dice_number[4]
bo = dice_number[5]
input_orders = gets.chomp.to_s
orders = []
size = input_orders.size
for i in 0...size
  orders << input_orders[i]
end

dice = Dice.new(f, ba, r, l, t, bo)
dice.execute_orders(orders)
puts $top
