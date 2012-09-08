#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require '../lib/color/color_monkey_patch'
require '../lib/agrs/agrs_xml'
require '../lib/agrs/agrs_ssl'
require '../lib/algorithm/ssrra'
require '../lib/visualization/visualization'
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
when "-s","show"
  rank = AgrsXML.new 
  @dir = "#{config['agreements_dir']}/*"
  
  # Cтруктура массива ri  
  # r[0] = number
  # r[1][0] = id
  # r[1][1] = category
  # r[1][2] = data
  # r[1][3] = Initiator
  # r[1][4] = Initiator score
  # r[1][5] = Follower
  # r[1][6] = Follower score

  # Формируем два новых массива ri и rf
  # ri[0] = id инициатора
  # ri[1][1] = рейтинг инициатора на текущий момент согласно алгоритму
  # ri[1][2] = кол-во оценок 1 сделаных другим пользователям, в качестве инициатора
  # ri[1][3] = кол-во оценок 2 сделаных другим пользователям, в качестве инициатора
  # ri[1][4] = кол-во оценок 3 сделаных другим пользователям, в качестве инициатора
  # ri[1][5] = кол-во оценок 4 сделаных другим пользователям, в качестве инициатора
  # ri[1][6] = кол-во оценок 5 сделаных другим пользователям, в качестве инициатора
 
 # Структура rf аналогична ri


 # Получение массива состоящего из двух хешей рейтингов ri и rf 
 @two_ratings = rank.get_rating(@dir)
 @ri = @two_ratings[0]
 @rf = @two_ratings[1]

 # Визуализация рейтингов 
 vis = RankingVisualization.new
 vis.ranking_print(@ri,@rf)

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

