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

  def find_back_by_fr(order_f, order_r)
    loop do
      tmp = execute_orders(["N", "S", "E", "W"].sample)
      if $top == order_f && $back == order_r
        break
      end
    end
    return $right
  end
end

dice_number = gets.chomp.split.map(&:to_i)
t = dice_number[0]
ba = dice_number[1]
r = dice_number[2]
l = dice_number[3]
f = dice_number[4]
bo = dice_number[5]
num = gets.chomp.to_i
answers = []
num.times do
  input_fr = gets.chomp.split.map(&:to_i)
  order_f = input_fr[0]
  order_r = input_fr[1]
  dice = Dice.new(f, ba, r, l, t, bo)
  answers << dice.find_back_by_fr(order_f, order_r)
end
answers.each do |i|
  puts i
end
