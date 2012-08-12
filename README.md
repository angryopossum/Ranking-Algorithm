Ranking-Algorithm
=================

Getting started
-----------------
Программа предназначена для вычисления рейтинга репутаций.

Create keys
----------------
Генерация Частного ключа 
 
	openssl genrsa -out privat.key 1024

Генерация Публичного ключа

	 openssl rsa -in privat.key -pubout -out public.key

