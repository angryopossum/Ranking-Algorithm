#! /usr/bin/env ruby

require "rexml/document"



class AgrsXML

 def agrs_to_arr (f)
 # Формирование массива из xml документов 
  
  file = File.new(f)
  doc = REXML::Document.new file
  root = doc.root
  rank_arr = {}
  rank_arr[0] = root.elements['id'].text
  rank_arr[1] = root.elements['category'].text
  rank_arr[2] = root.elements['date'].text
  rank_arr[3] = root.elements['initiator'].text
  rank_arr[4] = root.elements['initiator_score'].text
  rank_arr[5] = root.elements['follower'].text
  rank_arr[6] = root.elements['follower_score'].text
  return  rank_arr
 end

 def agrs_dir (d)
  rank_table = {}
  @agrs = Dir.glob(d)
  i = 0
  @agrs.each do |filename|
  
  rank_table[i] =  agrs_to_arr(filename)
  i=i+1
  end
 return  rank_table
end

 def  get_rating (dir)
  
 @dir =dir
 r = agrs_dir(@dir)
 alg = SuperSecretReputationRankingAlgorithm.new
 
  ri = Hash.new
  rf = Hash.new


  r.each do |r|

   @initiator = r[1][3]
   @follower = r[1][5]
   @sf =  r[1][6].to_i
   @si =  r[1][4]

   if !ri.has_key?(@initiator) then

     ri[@initiator] = Array.new
     ri[@initiator] = [1,0,0,0,0,0]

  end

   if !rf.has_key?(@follower)  then

     rf[@follower] = Array.new
     rf[@follower] = [1,0,0,0,0,0]

  end

  # Формирование новых рейтингов 
   ri = alg.calculate(@initiator,@follower,@sf,ri,rf)
   rf = alg.calculate(@follower,@initiator,@si,rf,ri)

   # Обновление счетчиков оценок 
   ri = alg.renew_score_counter(@initiator,@si,ri)
   rf = alg.renew_score_counter(@follower,@sf,rf)

  end

  @rating = Array.new
  @rating[0] = ri
  @rating[1] = rf


  return @rating

 end



end 
