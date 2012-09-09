#! /usr/bin/env ruby

class RankingVisualization

 def make_ranking (ri,rf)

  @ri = ri
  @rf = rf
  @super_ranking = {}

  @ri.keys.each do |k|

    if !@super_ranking.has_key?(k) then
      @super_ranking[k] = Array.new
      @super_ranking[k] = [0,0]
    end

    @super_ranking[k][0] = @ri[k]
  end

  @rf.keys.each do |k|

    if !@super_ranking.has_key?(k) then
      @super_ranking[k] = Array.new
      @super_ranking[k] = [0,0]
    end

   @super_ranking[k][1] = @rf[k]
  end

 return @super_ranking
 end

 def ranking_print(ri,rf)
  @ri = ri
  @rf = rf
  @super_ranking = make_ranking(@ri,@rf)
  print "---------------------------------\n"
  print "ID (Ri/Rf) [1:2:3:4:5][1:2:3:4:5]\n"
  print "---------------------------------\n"


   @super_ranking.keys.sort.each do |k|
    @id = k.green42
    @ri = @super_ranking[k][0][0].to_s.green
    @rf = @super_ranking[k][1][0].to_s.yellow192
    @s1i = @super_ranking[k][0][1].to_s.green
    @s2i = @super_ranking[k][0][2].to_s.green
    @s3i = @super_ranking[k][0][3].to_s.green
    @s4i = @super_ranking[k][0][4].to_s.green
    @s5i = @super_ranking[k][0][5].to_s.green


    @s1f = @super_ranking[k][1][1].to_s
    @s2f = @super_ranking[k][1][2].to_s
    @s3f = @super_ranking[k][1][3].to_s
    @s4f = @super_ranking[k][1][4].to_s
    @s5f = @super_ranking[k][1][5].to_s



    print "#{@id}: (#{@ri}/#{@rf})[#{@s1i}:#{@s2i}:#{@s3i}:#{@s4i}:#{@s5i}]"
    print "[#{@s1f}:#{@s2f}:#{@s3f}:#{@s4f}:#{@s5f}]\n".yellow192
  end

 end

 def ranking_print_short(ri,rf)
  @ri = ri
  @rf = rf
  @super_ranking = make_ranking(@ri,@rf)
  print "ID (Ri/Rf)\n"
  print "------------\n"


   @super_ranking.keys.sort.each do |k|
   print "#{k.green42}: (#{@super_ranking[k][0][0].to_s.green}/#{@super_ranking[k][1][0].to_s.yellow192})\n"
  end

 end



end 
