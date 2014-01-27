#coding:utf-8
require 'benchmark'

puts Benchmark::measure{

#N = 20
#K = 5
  N = 7
  K = 2

  $road_t   = [50, 287, 621, 266, 224, 68, 636]
  $flight_t = [797, 661, 644, 102, 114, 452, 420]
  $dp = Array.new(N+1).map{Array.new(K+1)}

#iが0の時は移動なしという意味なので移動距離は0
  for j in 0..K
    $dp[0][j] = 0
  end

=begin
漸化式的っぽいメモ（i=N：都市数, j=K：空路つかっていい回数）
$dp[0][j] = 0 #移動距離0  (i=0)
$dp[i][0] = $dp[i-1][j]+r[i-1]  #陸路だけ使う、前の計算＋前の道 (j < 0)
$dp[i][j] = min(r[i-1],$dp[i-1][j-1]+f[i-1]) #陸路と空路の選択肢がある場合は陸路のみのときと、空路を使った時のけいさんの最小値

漸化式のとおりにプログラムするという概念を理解した日
っていうか漸化式ってプログラムじゃん！（いまさら
=end

  for i in 1..N
    for j in 0..K
      road = $dp[i-1][j] + $road_t[i-1]
      if j == 0
        $dp[i][j] = road
      else
        $dp[i][j] = [road,$dp[i-1][j-1]+$flight_t[i-1]].min
      end

    end
  end

  puts "return : #{$dp[N].min}"
}