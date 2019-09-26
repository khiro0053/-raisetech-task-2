#配列の勉強

#要素の取得
nums = [1, 2, 3]
nums[0]　#=> 1
nums[3] #=> nil
nums[1, 2] #=> [2, 3]
nums[- 1] #=> 3(最後の要素の取得)
nums[-2, 2] #=> [2, 3]
nums.last(2) #=> [2, 3]
nums.first(2) #=> [1, 2]

#要素の数を取得
nums.size #=> 3
nums.length #=> 3

#要素の合計
nums.sum #=> 6

#要素の追加
nums << 4 #=> [1, 2, 3, 4]
nums << [5,6] #=> [1, 2, 3, 4, [5, 6]]
nums.size #=> 5
nums[4][1] #=> 6

#要素の削除
nums.delete_at(4) #=> [5, 6] 削除した値が戻り値

#多重代入
a, b, c   = [1, 2]


#繰り返し
nums = [1, 2, 3]
sum = 0
nums.each do |n|
  sum += n
end

#改行しない場合の繰り返し
nums = [1, 2, 3]
sum = 0
nums.each { |n| sum += n }

#ブロックを使った配列のいろいろなメソッド
nums = [1, 2, 3]
double_nums = nums.map { |n| n * 2 } #=> [2, 4, 6]
even_nums = nums.select { |n| n.even? } #=> [2]
odd_nums = nums.reject { |n| n.even? } #=> [1, 3]
odd_nums = nums.delete_if{ |n| n.even? } #=> [1, 3]
find_odd_num = nums.find { |n| n.odd? } #=> 1 (配列ではなく要素を返す)
sum = nums.inject(10) { |result, n| result + n} #=> 16