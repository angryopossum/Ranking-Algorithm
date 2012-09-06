#! /usr/bin/env ruby

class RankingVisualization

 def ranking_print (rating)

  @rating = rating

  @rating.keys.each do |k|
   print "#{k.green42}:#{@rating[k][0].to_s.green}\n"
  end

 end

end 
