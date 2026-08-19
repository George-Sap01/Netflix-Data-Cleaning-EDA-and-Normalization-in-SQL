/*
===============================================================================
Script Purpose:
    The script loads data from external CSV files. 
===============================================================================
*/

show variables like 'local_infile';
select version();
set global local_infile = 1;
show variables like 'local_infile';
    
truncate table dirty_netflix;

-- The filepath needs filling
load data local infile "-----------"
into table dirty_netflix
character set utf8mb4
fields terminated by ','
enclosed by '"'
escaped by '"'
lines terminated by '\n'
ignore 1 rows 
(
	show_id,
    type,
    title,
    director,
    cast,
    country,
    date_added,
    release_year,
    rating,
    duration,
    listed_in, 
    description
);

