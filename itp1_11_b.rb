class Dice
  def initialize(front, back, right, left, top, bottom)
    $front = front
    $back = back
    $right = right
    $left = left
    $top = top
    $bottom = bottom
  end

  def find_back_by_fr(order_front, Dorder_right)
    loop do
      tmp = execute_orders(["N", "S", "E", "W"].sample)
      if $top == order_front && $back == order_right
        break
      end
    end
    return $right
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

dice_number = gets.chomp.split.map(&:to_i)
top = dice_number[0]
back = dice_number[1]
right = dice_number[2]
left = dice_number[3]
front = dice_number[4]
bottom = dice_number[5]
num = gets.chomp.to_i
answers = []
num.times do
  input_fr = gets.chomp.split.map(&:to_i)
  order_front = input_fr[0]
  order_right = input_fr[1]
  dice = Dice.new(front, back, right, left, top, bottom)
  answers << dice.find_back_by_fr(order_front, order_right)
end
answers.each do |i|
  puts i
end
