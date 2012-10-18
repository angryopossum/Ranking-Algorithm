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
  @m = margins(@ri,@rf)


  @id_header = "ID"
  @ri_header = "Ri"
  @rf_header = "Rf"
  @s1_header = "1"
  @s2_header = "2"
  @s3_header = "3"
  @s4_header = "4"
  @s5_header = "5"

  @marg_id = string_margin(@id_header,@m[0]) 
  @marg_ri = string_margin(@ri_header,@m[1]) 
  @marg_rf = string_margin(@rf_header,@m[2]) 
  @marg_score_1 = string_margin(@s1_header,@m[3]) 
  @marg_score_2 = string_margin(@s2_header,@m[4]) 
  @marg_score_3 = string_margin(@s3_header,@m[5]) 
  @marg_score_4 = string_margin(@s4_header,@m[6]) 
  @marg_score_5 = string_margin(@s5_header,@m[7]) 

  @marg_score_1f = string_margin(@s1_header,@m[8])
  @marg_score_2f = string_margin(@s2_header,@m[9])
  @marg_score_3f = string_margin(@s3_header,@m[10])
  @marg_score_4f = string_margin(@s4_header,@m[11])
  @marg_score_5f = string_margin(@s5_header,@m[12])



  @m.inject(0){|r,e| r+e}.times{print "-"}
  print "-------------------\n"
  print "#{@id_header}:#@marg_id (#{@ri_header}/#{@rf_header})#{@marg_ri}#{@marg_rf} "
  print "[#{@s1_header}#{@marg_score_1}:#{@s2_header}#{@marg_score_2}:#{@s3_header}#{@marg_score_3}:#{@s4_header}#{@marg_score_4}:#{@s5_header}#{@marg_score_5}] "
  print "[#{@s1_header}#{@marg_score_1f}:#{@s2_header}#{@marg_score_2f}:#{@s3_header}#{@marg_score_3f}:#{@s4_header}#{@marg_score_4f}:#{@s5_header}#{@marg_score_5f}]\n"
  @m.inject(0){|r,e| r+e}.times{print "-"}
  print "-------------------\n"


   @super_ranking.keys.sort.each do |k|
    @id = k.green42
    @ri1 = @super_ranking[k][0][0].to_s.green
    @rf1 = @super_ranking[k][1][0].to_s.yellow192
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

    @total_i = 0
    @total_f = 0
    #@super_ranking[k][0][1..5].each{|x| @total_i = @total_i + x}
    #@super_ranking[k][1][1..5].each{|x| @total_f = @total_f + x}

   
    @marg1 = string_margin(k,@m[0])
    @marg2 = string_margin(@super_ranking[k][0][0].to_s,@m[1])
    @marg3 = string_margin(@super_ranking[k][1][0].to_s,@m[2])

    @marg4 = string_margin(@super_ranking[k][0][1].to_s,@m[3])
    @marg5 = string_margin(@super_ranking[k][0][2].to_s,@m[4])
    @marg6 = string_margin(@super_ranking[k][0][3].to_s,@m[5])
    @marg7 = string_margin(@super_ranking[k][0][4].to_s,@m[6])
    @marg8 = string_margin(@super_ranking[k][0][5].to_s,@m[7])
    
    @marg9 = string_margin(@super_ranking[k][1][1].to_s,@m[8])
    @marg10 = string_margin(@super_ranking[k][1][2].to_s,@m[9])
    @marg11 = string_margin(@super_ranking[k][1][3].to_s,@m[10])
    @marg12 = string_margin(@super_ranking[k][1][4].to_s,@m[11])
    @marg13 = string_margin(@super_ranking[k][1][5].to_s,@m[12])

    print "#{@id}: #{@marg1}(#{@ri1}/#{@rf1}) #{@marg2}#{@marg3}"
    print "[#{@s1i}#{@marg4}:#{@s2i}#{@marg5}:#{@s3i}#{@marg6}:#{@s4i}#{@marg7}:#{@s5i}#{@marg8}] ".green
    print "[#{@s1f}#{@marg9}:#{@s2f}#{@marg10}:#{@s3f}#{@marg11}:#{@s4f}#{@marg12}:#{@s5f}#{@marg13}]\n".yellow192
    #print "[#{@total_i}/#{@total_f}]\n".red
  end

  @m.inject(0){|r,e| r+e}.times{print "-"}
  print "-------------------\n\n"

 end

 def ranking_print_short(ri,rf)
  @ri = ri
  @rf = rf
  @super_ranking = make_ranking(@ri,@rf)
  print "ID (Ri/Rf)\n"
  print "------------\n"

 
   @m = margins(ri,rf)
   
   @super_ranking.keys.sort.each do |k|
   @marg1 = string_margin(k,@m[1])
   @marg2 = string_margin(@super_ranking[k][0][0].to_s,@m[2])
   @marg3 = string_margin(@super_ranking[k][1][0].to_s,@m[3])
   print "#{k.green42}:#{@marg1}(#{@super_ranking[k][0][0].to_s.green}/#{@super_ranking[k][1][0].to_s.yellow192}#{@marg2}#{@marg3})\n"

  end

 end

 def margins(ri,rf)
  @ri = ri
  @rf = rf

  @super_ranking = make_ranking(@ri,@rf)
 @m = Array.new
 
 @m[0] =  @super_ranking.keys.max.size
 @m[1] = maximum(@super_ranking,0,0).to_s.size
 @m[2] = maximum(@super_ranking,1,0).to_s.size
 @m[3] = maximum(@super_ranking,0,1).to_s.size
 @m[4] = maximum(@super_ranking,0,2).to_s.size
 @m[5] = maximum(@super_ranking,0,3).to_s.size
 @m[6] = maximum(@super_ranking,0,4).to_s.size
 @m[7] = maximum(@super_ranking,0,5).to_s.size
 @m[8] = maximum(@super_ranking,1,1).to_s.size
 @m[9] = maximum(@super_ranking,1,2).to_s.size
 @m[10] = maximum(@super_ranking,1,3).to_s.size
 @m[11] = maximum(@super_ranking,1,4).to_s.size
 @m[12] = maximum(@super_ranking,1,5).to_s.size

 return @m

 end

 # Вычисляет максимальное значение в позициях из массива super_ranking
 def maximum(super_ranking,n_1,n_2)
  j=0
  @n_1 = n_1
  @n_2 = n_2

  @arr = Array.new
  @super_ranking=super_ranking
  @super_ranking.keys.sort.each do |k|
    @arr[j] = @super_ranking[k][@n_1][@n_2]
    j=j+1
  end
  @maximum = @arr.max 
  return @maximum
 end

 # Вставляет необходимое кол-во пробелов
 def string_margin(string,max)
   @string = string
   @max = max
   @marg=""
   @difference = max - @string.size
   @difference.times{|i| @marg = @marg + " "}

   return @marg
 end 




end 
