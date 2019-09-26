#引数が０なら偽、１なら真と表示
def ture_or_false(num)
  if num == 0
    puts "偽"
  elsif num == 1
    puts "真"
  else
    puts "0か１を入力してください。"
  end
end

3.times { | n | ture_or_false(n) }
