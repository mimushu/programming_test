class Dice

  def initialize(dice_numbers)
    $top = dice_numbers[0]
    $back = dice_numbers[1]
    $right = dice_numbers[2]
    $left = dice_numbers[3]
    $front = dice_numbers[4]
    $bottom = dice_numbers[5]
  end

  def find_south_by_fb(order_front, order_back)
    loop do
      tmp = execute_orders(["N", "S", "E", "W"].sample)
      if $top == order_front && $south == order_back

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


dice_numbers = gets.chomp.split.map(&:to_i)

num = gets.chomp.to_i
answers = []
num.times do
  input_fr = gets.chomp.split.map(&:to_i)
  order_front = input_fb[0]
  order_back = input_fb[1]
  dice = Dice.new(dice_numbers)
  answers << dice.find_back_by_fb(order_front, order_back)

end
answers.each do |i|
  puts i
end
