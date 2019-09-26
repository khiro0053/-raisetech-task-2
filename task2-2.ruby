#コンソールに1〜10を足したものを表示
def sum
  num = 0
  1.upto 10 do |n|
    num += n
  end
  puts num
end

sum()