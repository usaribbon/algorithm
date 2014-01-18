#coding:utf-8

area = [" "," "," "," "," "," "," ","*"," "," "],
        [" ","*"," ","*"," "," "," "," "," "," "],
        [" "," ","*"," "," "," "," "," "," ","*"],
        [" "," "," "," "," ","*"," ","*"," "," "],
        [" ","*"," ","*"," "," ","*"," "," "," "],
        [" "," "," "," "," "," "," "," ","*"," "],
        [" ","*"," "," ","*"," ","*"," "," "," "],
        [" "," ","*","*"," "," ","*"," "," ","*"]

w=area[0].length
h=area.length
res=0
res_now=0
S=4
T=3

#p area[0][1]

p w,h,S,T
N=16

res = 0
res_now = 0

h.times do |h|
  w.times do |w|
    T.times do |t|
      S.times do |s|
        nh=h+t
        nw=s+w
        break if nh < h or nw < w
        res_now+= 1 if area[nh][nw] == "*"
        #p "#{nh},#{nw}"# if area[nh][nw] == "*"
      end
    res = res_now if res < res_now
    end
    res_now=0
    p "res is #{res}"
  w+=S
  end
  h+=T
end


#area[h][w]