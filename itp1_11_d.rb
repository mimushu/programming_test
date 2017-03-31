class Dice
  def initialize(top, back, right, left, front, bottom)
    $front = front
    $back = back
    $right = right
    $left = left
    $top = top
    $bottom = bottom
  end

  def check_dices_same(order_top, order_back, order_right, order_left, order_front, order_bottom)
      100.times do
        execute_orders(["N", "W"].sample)
        return true if $top == order_top && $back == order_back && $right == order_r && $left == order_left && $front == order_front && $bottom == order_bottom
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
