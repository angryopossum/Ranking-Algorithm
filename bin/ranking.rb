#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require '../lib/color/color_monkey_patch'
require '../lib/agrs/agrs_xml'
require '../lib/agrs/agrs_ssl'
require '../lib/algorithm/algorithm'
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
when "-c"
  rank = AgrsXML.new 
  @dir = "#{config['agreements_dir']}/*"
  r = rank.agrs_dir(@dir)

  alg = Algorithm.new
  
 # 1. Проверка файлов на корректность
 # 2. Вычисление рейтинга 
  # r[0] = number
  # r[1][0] = id
  # r[1][1] = category
  # r[1][2] = data
  # r[1][3] = Initiator
  # r[1][4] = Initiator score
  # r[1][5] = Follower
  # r[1][6] = Follower score

  # Фрмируем два новых массива ri и rf
  # ri[0] = id инициатора
  # ri[1][1] = рейтинг инициатора на текущий момент согласно алгоритму
  # ri[1][2] = кол-во оценок 1 сделаных другим пользователям, в качестве инициатора
  # ri[1][3] = кол-во оценок 2 сделаных другим пользователям, в качестве инициатора
  # ri[1][4] = кол-во оценок 3 сделаных другим пользователям, в качестве инициатора
  # ri[1][5] = кол-во оценок 4 сделаных другим пользователям, в качестве инициатора
  # ri[1][6] = кол-во оценок 5 сделаных другим пользователям, в качестве инициатора
 
 # Структура Rf аналогична Ri

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
   ri = alg.new_rating(@initiator,@follower,@sf,ri,rf)
   rf = alg.new_rating(@follower,@initiator,@si,rf,ri)

   # Обновление счетчиков оценок 
   ri = alg.renew_score_counter(@initiator,@si,ri)
   rf = alg.renew_score_counter(@follower,@sf,rf)

   print "#{@initiator}:#{ri[@initiator][0]}:#{ri[@initiator][1]}:#{ri[@initiator][2]}:#{ri[@initiator][3]}:#{ri[@initiator][4]}:#{ri[@initiator][5]}\n"
   print "#{@follower}:#{rf[@follower][0]}:#{rf[@follower][1]}:#{rf[@follower][2]}:#{rf[@follower][3]}:#{rf[@follower][4]}:#{rf[@follower][5]}\n"
   print "\n"

  end

vis = RankingVisualization.new
print "Initiator ranking table:\n"
print "------------------------\n"
vis.ranking_print(ri)
print "Follower ranking table:\n"
print "------------------------\n"
vis.ranking_print(rf)

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

