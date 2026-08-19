/*
===============================================================================
Script Purpose: 
	Create table to insert clean data with correct data types
		1) Changing the name of the show_id to id 
        2) Creating a surrogate (primary) key using auto increment
        3) Change the data types to correct ones
===============================================================================
*/

drop table if exists clean_data;

create table if not exists clean_data (
	id 			 int primary key not null auto_increment,
    type		 varchar(100), 
    title   	 varchar(250),
    director 	 varchar(250),
    cast		 text,
    country 	 varchar(250),
    date_added   date,
    release_year int,
    duration     varchar(100),
    listed_in    varchar(100),
    description	 text
);

truncate table clean_data;

insert into clean_data(type, title, director, cast, country, date_added, release_year, duration, listed_in, description) 
	select 
		type, 
        title, 
        director, 
        cast,
        country,
        str_to_date(date_added, '%M %d, %Y'), -- e.g. September 25, 2021
        release_year, 
        duration,
        listed_in,
        description 
	from staging;
    
-- check the result of the query 
select column_name, data_type, column_key
from information_schema.columns
where table_schema = 'netflix' and table_name = 'clean_data';