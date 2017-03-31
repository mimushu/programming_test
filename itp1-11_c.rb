class Dice
  def initialize(t, s, e, w, n, b)
    $north = n
    $south = s
    $east = e
    $west = w
    $top = t
    $bottom = b
  end

  def execute_orders(orders)
    length = orders.length
    for i in 0...length
      if orders[i] == "N"
        move_north
      elsif orders[i] == "S"
        move_south
      elsif orders[i] == "E"
        move_east
      elsif orders[i] == "W"
        move_west
      else
        puts "error!"
      end
    end
  end

  def check_dices_same(order_t, order_s, order_e, order_w, order_n, order_b)
      100.times do
        execute_orders(["N", "W"].sample)
        return true if $top == order_t && $south == order_s && $east == order_e && $west == order_w && $north == order_n && $bottom == order_b
      end
    return false
  end


  private
  def move_north
    north = $north
    south = $south
    top = $top
    bottom = $bottom
    $north = top
    $top = south
    $bottom = north
    $south = bottom
  end

  def move_south
    north = $north
    south = $south
    top = $top
    bottom = $bottom
    $south = top
    $bottom = south
    $north = bottom
    $top = north
  end

  def move_east
    top = $top
    bottom = $bottom
    east = $east
    west = $west
    $east = top
    $bottom = east
    $west = bottom
    $top = west
  end

  def move_west
    top = $top
    bottom = $bottom
    east = $east
    west = $west
    $west = top
    $bottom = west
    $east = bottom
    $top = east
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
