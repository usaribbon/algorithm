#coding:utf-8
#N=整数　をいれると、約数の個数がNである最小の整数Jを返すプログラミング
#某問題集の擬似コードが出題される
#とりあえず素数は100くらいまでのいれてみた

def soinsu_bunkai(num)
#Jを素因数分解
  j=0
  n = num
  until n == 1
    if n % $sosu[j] == 0
      n = n / $sosu[j]
      #p n
      $shisu[j] += 1
    else
      j+= 1
    end
  end
end

def number_of_yakusu()
#p shisu
#Jの約数の個数を数える
  res = $shisu[0]+1
  i = 1
  until $shisu[i] == 0
    res = res * ($shisu[i]+1)
    i += 1
  end
  res
end

#main
puts 'n個の約数をもつ最小の整数Jを返します、nを整数で入力して下さい'
N=gets.chomp


#素数のファイル読み込み
$sosu=Array.new
plimenum = File.open('primelist1000000.txt','r')
plimenum.each_line do |f|
  $sosu << f.chomp.to_i
end
plimenum.close

$shisu= Array.new($sosu.size,0)

res_n = 0
j=1
until res_n==N
  soinsu_bunkai(j)
  res_n = number_of_yakusu()
  if res_n == N
    p j
  end
  j += 1

  p j
  $shisu.size.times do |i|
    $shisu[i] = 0
  end

end

