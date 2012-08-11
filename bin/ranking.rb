#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require '../lib/color/color_monkey_patch'
require '../lib/agrs/agrs_xml'
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

  r.each do |rank_2| 
   print "#{rank_2[1][0]}:#{rank_2[1][1]}\n".green
  end

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

