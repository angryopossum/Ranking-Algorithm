#! /usr/bin/env ruby

#require "rexml/document"

class RankingVisualization

 def ranking_print (rating)

  @rating = rating

  @rating.keys.each do |k|
   print "#{k}:#{@rating[k][0]}\n"
  end

 end

end 
