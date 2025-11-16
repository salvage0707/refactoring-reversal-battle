(1..100).each do |i|
  hoge = if i % 15 == 0
           "'fizzbuzz'"
         elsif i % 3 == 0
           "'fizz'"
         elsif i % 5 == 0
           "'buzz'"
         else
           i.to_s
         end
  puts hoge + ','
end
