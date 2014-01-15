# encoding: utf-8

#合計
$A=620

#コイン
$V=[1,5,10,50,100,500]
#コインに対応した枚数
$C=[3,2,1,3,0,2]

def pay()
  ans = $A

  #お金から高い方から使っていく
  5.downto(0) do |i|
    maisuu = [(ans / $V[i]).to_i,$C[i]].min
    puts "#{$V[i]}円玉を#{maisuu}枚つかった"
    #maisuu = (ans / $V[i]).to_i
    ans -= maisuu * $V[i]
    #$V[i],maisuu
    
  end

end

pay()