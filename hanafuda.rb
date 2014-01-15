#coding : utf-8

def shuffle(fuda,p,c)
  #5枚のうち、3枚目(p-1)から1(c)まい上にあげる。popで。
  fuda_c = fuda.slice!((p-1)..(p-1+c-1))
  #memo:push->最後に追加 pop->下からとる
  fuda_after = fuda_c.concat(fuda)
end

def init_shuffle(ready)
  #花札セット
  hanafuda = ready.chomp.split

  kaisuu = Array.new
  hanafuda[1].to_i.times do
    kaisuu << gets.chomp.split
  end

  r = hanafuda[1].to_i
  n = hanafuda[0].to_i

#rの分きく
  fuda = Array.new()
  n.times do |x|
    fuda << x + 1
  end
  fuda = fuda.reverse

#シャッフルしていく
  r.times do |i|
    p = kaisuu[i][0].to_i
    c = kaisuu[i][1].to_i

    fuda = shuffle(fuda,p,c)
  end
  return fuda
end


#main
puts "枚数とシャッフル回数をスペース区切りで入力して下さい
終了する場合は「0 0」と入力して下さい"

result = Array.new
ready = gets

while ready.chomp != "0 0"
  #0 0じゃなかったらセットつくる
  fuda = init_shuffle(ready)

  result << fuda.first
  #hanafuda = A
  ready = gets
end

result.length.times do
  puts result.shift
end





