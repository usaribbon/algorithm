#coding:utf-8

$char1=[".",",","!","?"," "]
$char2=["a","b","c"]
$char3=["d","e","f"]
$char4=["g","h","i"]
$char5=["j","k","l"]
$char6=["m","n","o"]
$char7=["p","q","r","s"]
$char8=["t","u","v"]
$char9=["w","x","y","z"]

char = Array.new
res = ""

#文字判定
def create_char(char)
  n = char.first
  r = char.size
  #p n
  char = eval("$char#{n}")

  char[r%char.size]

=begin
  これはだめ
  while(r > char.size)
    r=r-char.size
  end
=end
end


#入力用配列の作成
#入力受付けのループ
  while true
    #入力
    enter = gets.chomp!
    input = enter.split("").map(&:to_i)

    #0がきたら、判定開始
    #配列を関数になげる
    #配列のクリア
    #帰ってきた値をresにくっつける
    input.size.times do |n|
      #p "now#{n}-#{input[n]}"
      if input[n] != 0
        char << input[n]
      else
        res.concat(create_char(char)) unless char.size.zero?
        char.clear
      end
    end
    p res
    res.clear
  end

