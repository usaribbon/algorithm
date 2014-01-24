# coding:utf-8
# this code was cited from algorithm introduction no.2 p8-12

def print_cut_rod_solution(p,n)

end

#価格の配列
$p=[0,1,5,8,9,10,17,17,20,24,30,1,5,8,9,10,17,17,20,24,30,1,5,8,9,10,17,17,20,24,30,1,5,8,9,10,17,17,20,24,30]
#棒の長さ
$n=4

#再帰的トップ型ロッド切り出し->遅い
def cut_rod(p,n)
  if n==0
    return 0 #棒の長さが0だから収入も0円
  end
  q=-100000

  for i in 1..n
    q=[q,p[i]+cut_rod($p,n-i)].max
  end
  #切り出した分のお金
  #切り出した残りの棒も全部区切ってどれが一番高いかを調べる

  return q

end

def bottom_up_cut_rod(p,n)
  r = Array.new(n)
  r[0]=0

  for j in 1..n
    q=-100000
    for i in 1..j
      q=[q,p[i]+r[j-i]].max
    end
    r[j]=q
  end
  return r[n]
end

def extended_bottom_up_cut_rod(p,n)
  r=Array.new(n)#お金
  s=Array.new(n)#切り取る棒の長さ
  r[0]=0

  for j in 1..n
    q=-10000
    for i in 1..j
      if q<p[i]+r[j-i]
        q=p[i]+r[j-i]
        s[j]=i
      end
    end
    r[j]=q
  end
  return r,s
end

def print_cut_rod_solution(p,n)
  r,s=extended_bottom_up_cut_rod(p,n)

  while n>0
    puts "cut rod -> #{s[n]}"
    puts "get money -> #{r[n]}"
    n=n-s[n]
  end

end

#main

#遅いやつ
#p cut_rod($p,$n)
#p bottom_up_cut_rod($p,$n)
#puts extended_bottom_up_cut_rod($p,$n)

puts print_cut_rod_solution($p,7)