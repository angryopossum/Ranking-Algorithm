#! /usr/bin/env ruby

require "rexml/document"
require "base64"
require '../lib/agrs/agrs_ssl'

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
  rank_arr[7] = root.elements['Signature'].elements['initiator_signature'].text
  rank_arr[8] = root.elements['Signature'].elements['follower_signature'].text
  return  rank_arr
 end

 def agrs_dir (d)
  rank_table = {}
  @agrs = Dir.glob(d)
  i = 0
  @agrs.each do |filename|
  
  #rank_table[i] =  agrs_to_arr(filename)

  @c = AgrsSSL.new
 # print "#{@c.check_agrs(filename)}\n".yellow
 

 # Проверка правильности подписей intiator-a и follower-а 
 #if @c.check_agrs(filename) then
  rank_table[i] =  agrs_to_arr(filename)
  i=i+1
 #end

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
   @si =  r[1][4].to_i

   if !ri.has_key?(@initiator) then

     ri[@initiator] = Array.new
     ri[@initiator] = [2,0,0,0,0,0]

  end

   if !rf.has_key?(@follower)  then

     rf[@follower] = Array.new
     rf[@follower] = [2,0,0,0,0,0]

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

 def agrs_by_category(cat, dir)
  @ca = cat  
  @dir = dir
  @cat_2 = {}
  @agrs=agrs_dir(@dir)
  #print @agrs
  @j = 0
 # print @agrs
  @agrs.each do |k|
   @k = k[1][0]
   @cat_2[@k] =  k[1][1]
  # @j=@j+1
  end
  
  @k = 0
  @cat =Array.new

  #print @cat_2

  @cat_2.find_all{|key,value| value==@ca}.each do |n|
  #print n
  @cat[@k] = n[0]
  @k=@k+1
  end
  #print @cat.sort
  return @cat
 end



end
