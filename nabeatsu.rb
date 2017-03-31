def judge_aho(number)
  if number%3 == 0 || number.to_s.include?("3")
    return true
  else
    return false
  end
end

def judge_dog(number)
  if number%5 == 0
    return true
  else
    return false
  end
end

def judge_aho_and_dog(number)
  if judge_aho(number) == true && judge_dog(number) == true
    return true
  else
    return false
  end
end

def execute_orders(last_number)
  for i in 0..last_number
    if i == 0 || i == 1 || i == 7
      puts i
    elsif judge_aho_and_dog(i)
      puts "#{i}(ｱｵｵｰﾝ...)\n"
    elsif judge_aho(i)
      puts "#{i}(ｱﾎ)\n"
    elsif judge_dog(i)
      puts "#{i}(ｶﾞﾙﾙー)\n"
    else
      puts i
    end
  end
end

last_number = gets.chomp.to_i
execute_orders(last_number)
