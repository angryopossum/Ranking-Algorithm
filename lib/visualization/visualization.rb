#! /usr/bin/env ruby

class RankingVisualization

 def ranking_print (ri,rf)

  @ri = ri
  @rf = rf
  @super_ranking = {}

  @ri.keys.each do |k|

    if !@super_ranking.has_key?(k) then
      @super_ranking[k] = Array.new
      @super_ranking[k] = [0,0]
    end

    @super_ranking[k][0] = ri[k][0] 
  end

  @rf.keys.each do |k|

    if !@super_ranking.has_key?(k) then
      @super_ranking[k] = Array.new
      @super_ranking[k] = [0,0]
    end

   @super_ranking[k][1] = rf[k][0]
  end

  print "ID (Ri/Rf)\n"
  print "------------\n"


  @super_ranking.keys.sort.each do |k|
   print "#{k.green42}: (#{@super_ranking[k][0].to_s.green}/#{@super_ranking[k][1].to_s.yellow192})\n"
  end
 end

end 
