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

n = gets.chomp.to_i
dices = []
n.times do
  dice = gets.chomp.split.map(&:to_i)
  dices << dice
end
flag = 0
for i in 0...n-1
  dice = Dice.new(dices[i][0], dices[i][1], dices[i][2], dices[i][3], dices[i][4], dices[i][5])
  for j in i+1...n
    if dice.check_dices_same(dices[j][0], dices[j][1], dices[j][2], dices[j][3], dices[j][4], dices[j][5])
      puts "No"
      flag += 1
      break
    end
  end
  if flag == 1
    break
  end
  if dice.check_dices_same(dices[n-1][0], dices[n-1][1], dices[n-1][2], dices[n-1][3], dices[n-1][4], dices[n-1][5])
    puts "No"
    flag += 1
    break
  end
end
if flag == 0
  puts "Yes"
end
