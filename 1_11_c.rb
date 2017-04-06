class Dice
  def initialize(dice_numbers)
    $top = dice_numbers[0]
    $back = dice_numbers[1]
    $right = dice_numbers[2]
    $left = dice_numbers[3]
    $front = dice_numbers[4]
    $bottom = dice_numbers[5]
  end

  def check_dices_same(dice_numbers)
      order_top = dice_numbers[0]
      order_back = dice_numbers[1]
      order_right = dice_numbers[2]
      order_left = dice_numbers[3]
      order_front = dice_numbers[4]
      order_bottom = dice_numbers[5]
      100.times do
        execute_orders(["N", "W"].sample)
        return true if $top == order_top && $back == order_back && $right == order_right && $left == order_left && $front == order_front && $bottom == order_bottom

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
dice1 = Dice.new(d1)
if dice1.check_dices_same(d2)

  puts "Yes"
else
  puts "No"
end
