#! /usr/bin/env ruby


class Algorithm

 def simple (rank_table)

  @rt = {}

  rank_table.each do |rank_2|
 #  print "#{rank_2[1][0].green}:#{rank_2[1][1].green42}:#{rank_2[1][2].green}:#{rank_2[1][3].green42}\n"
   @rt[rank_2[1][0]] = @rt[rank_2[1][0]].to_i + rank_2[1][3].to_i
   @rt[rank_2[1][2]] = @rt[rank_2[1][2]].to_i + rank_2[1][1].to_i
  end

  @rt.keys.each do  |r|
   print "#{r.green}:#{@rt[r].to_s.green42}\n"
  end

 end

end 
