class Dice
  def initialize(top, back, right, left, front, bottom)
    $front = front
    $back = back
    $right = right
    $left = left
    $top = top
    $bottom = bottom
  end

  def check_dices_same(order_top, order_back, order_right, order_left, order_front, order_back)
      100.times do
        execute_orders(["N", "W"].sample)
        return true if $top == order_top && $back == order_back && $right == order_right && $left == order_left && $front == order_front && $bottom == order_back
      end
    return false
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

  def execute_orders(order)
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

d1 = gets.chomp.split.map(&:to_i)
d2 = gets.chomp.split.map(&:to_i)
dice1 = Dice.new(d1[0], d1[1], d1[2], d1[3], d1[4], d1[5])
if dice1.check_dices_same(d2[0], d2[1], d2[2], d2[3], d2[4], d2[5])
  puts "Yes"
else
  puts "No"
end
