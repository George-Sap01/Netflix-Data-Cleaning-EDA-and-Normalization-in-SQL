/*
===============================================================================
Script Purpose: 
	Create Table To Handle The Raw Data
	Keeping previous data type(text)
===============================================================================
*/

drop table if exists staging;

create table if not exists staging like dirty_netflix;

insert into staging select * from dirty_netflix;