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

   if  @rating_1[@user_1][0] < 1 then @rating_1[@user_1][0] = 1 end 
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

  # рейтинг не может быть меньше 1
  #if rating[user][0] < 1 then rating[user][0] = 1 end

  return @s*Math.log(rating[user][0]).round

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
