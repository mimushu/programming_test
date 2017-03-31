class Dice
  def initialize(t, ba, r, l, f, bo)
    $front = f
    $back = ba
    $right = r
    $left = l
    $top = t
    $bottom = bo
  end

  def execute_orders(orders)
    length = orders.length
    for i in 0...length
      if orders[i] == "N"
        move_front
      elsif orders[i] == "S"
        move_back
      elsif orders[i] == "E"
        move_right
      elsif orders[i] == "W"
        move_left
      else
        puts "error!"
      end
    end
  end

  def check_dices_same(order_t, order_ba, order_r, order_l, order_f, order_bo)
      100.times do
        execute_orders(["N", "W"].sample)
        return true if $top == order_t && $back == order_ba && $right == order_r && $left == order_l && $front == order_f && $bottom == order_bo
      end
    return false
  end


  private
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
end

d1 = gets.chomp.split.map(&:to_i)
d2 = gets.chomp.split.map(&:to_i)
dice1 = Dice.new(d1[0], d1[1], d1[2], d1[3], d1[4], d1[5])
if dice1.check_dices_same(d2[0], d2[1], d2[2], d2[3], d2[4], d2[5])
  puts "Yes"
else
  puts "No"
end
