Ranking-Algorithm
=================

Getting started
-----------------
Программа предназначена для вычисления рейтинга репутаций. Для вычисления рейтинга необходима уже собранная статистика соглашений, расположенная в папке agreements в виде xml-файлов. также необходиму публичне ключи участников и  сертификационного центра (CA).

Запуск программы

	rating.rb -s 
 

Create keys
----------------
Генерация Частного ключа 
 
	openssl genrsa -out privat.key 1024

Генерация Публичного ключа

	openssl rsa -in privat.key -pubout -out public.key

License
-------

Ranking-Algorithm is released under the MIT license:

   * www.opensource.org/licenses/MIT

