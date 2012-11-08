#! /usr/bin/env ruby

require "rexml/document"
require "base64"
require '../lib/agrs/agrs_ssl'
require '../lib/agrs/agrs_xml'

class AgrsCheck

  def get_category(f)
    @f = f


    @rank = AgrsXML.new

    @r = {}
    @cat = {}
    @cat_2 = Array.new
    @agrs = Dir.glob(@f)
    @i = 0
    @agrs.each do |filename|
     
    @r[@i] = @rank.agrs_to_arr(filename) 
    @cat[@i] = @r[@i][1]
    @i=@i+1
    end

    @cat_inv = @cat.invert
    @j = 0
    @cat_inv.keys.each do |k|
      @cat_2[@j] = k
      @j=@j+1
    end 

  return @cat_2
 
  end

 def check_category(cat,dir)
   @cat = cat
   @dir = dir  
   @a = AgrsXML.new
   @c = "15"
   @a.agrs_by_category(@c,@dir) 
 end


end
