#! /usr/bin/env ruby


class SuperSecretReputationRankingAlgorithm

 def calculate (user_1,user_2,score,rating_1,rating_2)

  @user_1 = user_1
  @user_2 = user_2
  @score = score.to_i
  @rating_1 = rating_1
  @rating_2 = rating_2

  #Вычисляем новый рейтинг на основании старого рейтинга и оценки
  @rating_1[@user_1][0] = @rating_1[@user_1][0] + sum_rating(@user_2,@score,@rating_2) 

  # рейтинг не может быть меньше 1
  if  @rating_1[@user_1][0] < 1 then @rating_1[@user_1][0] = 1 end
 
  print "#{user_2}:#{coef(user_2, rating_2)}\n"

  return @rating_1
 
 end

 def sum_rating (user,score,rating)
  
  case score
   when 1 then @s = -2 
   when 2 then @s = -1
   when 3 then @s = 0
   when 4 then @s = 1
   when 5 then @s = 2
  end

  return @s*Math.log(rating[user][0]).round

 end

#Дополнительная функция для расчета профилируещего коеффициента
 def coef_func (y,sum,k)
  @x = 1
  (y.to_f-sum*k).round.times{|x| @x=@x+@x*2}
  return @x
 end


 # Профилируещий коеффициент / Profiling factor
 def coef (user, rating)
   @c = 0
   @c1 = 0
   @c2 = 0
   @c3 = 0
   @c4 = 0
   @c5 = 0
   @sum = 1

   rating[user][1..5].each{|x| @sum = @sum + x}

   if rating[user][1].to_f/@sum > 0.15 then @c1 = coef_func(rating[user][1],@sum,0.4) end 
   if rating[user][2].to_f/@sum > 0.25 then @c2 = coef_func(rating[user][2],@sum,0.4) end 
   if rating[user][3].to_f/@sum > 0.35 then @c3 = coef_func(rating[user][3],@sum,0.4) end 
   if rating[user][4].to_f/@sum > 0.25 then @c4 = coef_func(rating[user][4],@sum,0.4) end 
   if rating[user][5].to_f/@sum > 0.15 then @c5 = coef_func(rating[user][5],@sum,0.4) end 


   @c = @c1 + @c2 + @c3 + @c4 + @c5

   return @c
 end



 def renew_score_counter (user,score,rating)

  @rating = rating

  case score 

   when 1 then @rating[user][1] = @rating[user][1] + 1 
   when 2 then @rating[user][2] = @rating[user][2] + 1 
   when 3 then @rating[user][3] = @rating[user][3] + 1 
   when 4 then @rating[user][4] = @rating[user][4] + 1 
   when 5 then @rating[user][5] = @rating[user][5] + 1

  end
 
  return @rating


 end


end
