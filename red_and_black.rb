#coding:utf-8

#p meiro[4][0]  [x][y]
$meiro = 0
$h=0
$w=0
$res =0
$all_res=0

$my_y=[0,0,-1,1]
$my_x=[1,-1,0,0]

#right y,x+1
#left y,x-1
#down y-1,x
#up y+1,x

def kensaku(y,x)
    $meiro[y][x] = "-"
    $res+=1

  4.times do |i|
    my= y+$my_y[i]
    mx= x+$my_x[i]

    unless my<$h && mx<$w && my>=0 && mx>=0 then next end
    unless $meiro[my][mx] === "." then next end

    kensaku(my,mx)
  end
end

#main
ready = gets.chomp!

while ready!="0 0"
  ready = ready.split.map(&:to_i)
  $h = ready[1]
  $w = ready[0]

  $meiro = Array.new

  $h.times do
    input = gets.chomp.split("")
    $meiro << input
  end

  $h.times do |y|
    $w.times do |x|
      kensaku(y,x) if $meiro[y][x] == "@"
    end
  end

  $all_res << $res
  $res = 0

  ready = gets.chomp!
end

puts $all_res
