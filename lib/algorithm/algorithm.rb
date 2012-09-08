#! /usr/bin/env ruby


class Algorithm


 def kof_func (y,sum,k)
  (y.to_f-sum*k).round.times{|x| x=x+x*2}
  return x
 end

 def not_so_simple (i,si,f,fi,rating)
  if rating.has_key?(i) then else 
     rating[i] = Array.new
     rating[i] = [1,0,0,0,0,0]
  end 
 
  if rating.has_key?(f) then else 
     rating[f] = Array.new
     rating[f] = [1,0,0,0,0,0]
  end 

  rating[i][1..5].each{|x| @sum_i +=x}

  kof = 0
  kof_1 = 0
  kof_2 = 0 
  kof_3 = 0 
  kof_4 = 0 
  kof_5 = 0 
  j = 0
 
 rating[i][1..5].each do |letter|

  j = j + 1

  if j == 1 and letter.to_f/@sum_i > 0.15 then kof_1 = kof_func(letter,@sum_i,0.1) end
  if j == 2 and letter.to_f/@sum_i > 0.25 then kof_2 = kof_func(letter,@sum_i,0.1) end
  if j == 3 and letter.to_f/@sum_i > 0.35 then kof_3 = kof_func(letter,@sum_i,0.1) end
  if j == 4 and letter.to_f/@sum_i > 0.25 then kof_4 = kof_func(letter,@sum_i,0.1) end
  if j == 5 and letter.to_f/@sum_i > 0.15 then kof_5 = kof_func(letter,@sum_i,0.1) end

 end

 kof =  kof_1 + kof_2 +kof_3 + kof_4 + kof_5  

 if fi == 1 then fi2 = -2 end
 if fi == 2 then fi2 = -1 end
 if fi == 3 then fi2 = 0 end
 if fi == 4 then fi2 = 1 end
 if fi == 5 then fi2 = 2 end

 if si == 1 then si = -2 end
 if si == 2 then si = -1 end
 if si == 3 then si = -0 end
 if si == 4 then si = 1 end
 if si == 5 then si = 2 end

 if fi2 == 0 then @k1 = 0 else @k2 = si2*Math.log(si2.abs*@rat_f).round end 
 if si2 == 0 then @k1 = 0 else @k2 = si2*Math.log(si2.abs*@rat_f).round - kof  end
 
 rating[i][0] = rating [i][0] + 1 
 rating[f][0] = rating [f][0] + 1 

 case si
  when 1 then rating[i][1] = rating[i][1] +1
  when 2 then rating[i][2] = rating[i][2] +1
  when 3 then rating[i][3] = rating[i][3] +1
  when 4 then rating[i][4] = rating[i][4] +1
  when 5 then rating[i][5] = rating[i][5] +1
 end

 case fi
  when 1 then rating[f][1] = rating[f][1] +1
  when 2 then rating[f][2] = rating[f][2] +1
  when 3 then rating[f][3] = rating[f][3] +1
  when 4 then rating[f][4] = rating[f][4] +1
  when 5 then rating[f][5] = rating[f][5] +1
 end

  return rating

 end

end
