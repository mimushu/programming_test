class Dice
  def initialize(front, back, right, left, top, bottom)
    $front = front
    $back = back
    $right = right
    $left = left
    $top = top
    $bottom = bottom
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

  private
  def move_front
    tmp = $top
    $top = $back
    $back = $bottom
    $bottom = $front
    $front = tmp
  end

  def move_back
    tmp = $back
    $back = $top
    $top = $front
    $front = $bottom
    $bottom = tmp
  end

  def move_right
    tmp = $right
    $right = $top
    $top = $left
    $left = $bottom
    $bottom = tmp
  end

  def move_left
    tmp = $left
    $left = $top
    $top = $right
    $right = $bottom
    $bottom = tmp
  end
end

dice_number = gets.chomp.split.map(&:to_i)
top = dice_number[0]
back = dice_number[1]
right = dice_number[2]
left = dice_number[3]
front = dice_number[4]
bottom = dice_number[5]
input_orders = gets.chomp.to_s
orders = []
size = input_orders.size
for i in 0...size
  orders << input_orders[i]
end

dice = Dice.new(front, back, right, left, top, bottom)
dice.execute_orders(orders)
puts $top
