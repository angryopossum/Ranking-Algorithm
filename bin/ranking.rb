#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require '../lib/color/color_monkey_patch'
require '../lib/agrs/agrs_xml'
require '../lib/agrs/agrs_ssl'
require '../lib/algorithm/algorithm'
require 'yaml'

config = YAML::load(open('../config.yml'))



def parse_options
  options = {}
  case ARGV[1]
  when "-e"
    options[:e] = ARGV[2]
  when "-d"
    options[:d] = ARGV[2]
  end
  return options
end


case ARGV[0]
when "-c"
  rank = AgrsXML.new 
  @dir = "#{config['agreements_dir']}/*"
  r = rank.agrs_dir(@dir)
  #to_algorithm = Algorithm.new


   #to_algorithm.simple(r)

   @i_key = "keys/public/A_public.key"
   @f_key = "keys/public/B_public.key"
   @ca_key = "keys/public/CA_public.key"

   agrs_check = AgrsSSL.new
   agrs_check.check_certificate(r,@i_key,@f_key,@ca_key)

 

when "-a"
  puts "called stop".pink
else
  puts <<-EOF
Please provide command name

Usage:
  ranking -c
  ranking -s
  

  options:

    -e ENVIRONMENT. Default: development
    -d DEAMON, true or false. Default: true

EOF
end

