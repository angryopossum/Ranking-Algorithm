#! /usr/bin/env ruby

require "rexml/document"



class AgrsXML

 def agrs_to_arr (f)

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

end 
