=begin
  coding:utf-8

  頭がつかれたのでゲームをつくったごみのようなマルバツゲーム
  たぶん恥ずかしくていつか消す

  遊び方：
  "y x"の形式で入力してね

=end


$board = ['','',''],
        ['','',''],
        ['','','']

now       = :black
next_turn = :while
maru      = {:black=>'●',:while=>'○'}
$game_status = true

def finish_msg(winner)
  puts "you win! : #{winner}"
  $game_status = false
end

def puts_map
  p $board[0]
  puts '-------------'
  p $board[1]
  puts '-------------'
  p $board[2]
end

while $game_status
  puts "now player is #{now}"
  input = gets.chomp.split.map(&:to_i)

  y=input[0]-1
  x=input[1]-1

  unless $board[y][x]==''
    puts 'error. try again to input'
    next
  end

  $board[y][x] = maru[now]

  #横
  3.times do |y|
    if $board[y] == [maru[now],maru[now],maru[now]]
      finish_msg(now)
    end
  end

  #縦
  3.times do |x|
    if $board[0][x] == maru[now] && $board[1][x] == maru[now] && $board[2][x] == maru[now]
      finish_msg(now)
    end
  end

  #斜め
  #この判定ひどすぎワロタｗｗｗｗ
  if ($board[0][0] == maru[now] && $board[1][1] == maru[now] && $board[2][2] = maru[now]) or ($board[0][2] == maru[now] && $board[1][1] == maru[now] && $board[2][0] = maru[now])
    finish_msg(now)
  end

  puts_map()

  tmp = now
  now = next_turn
  next_turn = tmp


  #温泉旅行行きたい
end