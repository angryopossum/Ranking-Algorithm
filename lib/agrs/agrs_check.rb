#! /usr/bin/env ruby

require "rexml/document"
require "base64"
require '../lib/agrs/agrs_ssl'
require '../lib/agrs/agrs_xml'

class AgrsCheck

  def get_stat(f)
    @f = f
    @rank = AgrsXML.new
    @r = @rank.agrs_dir (@f)
   
    print @r[0][0]
    print "\n"   
  end


end
