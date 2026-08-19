/*
===============================================================================
Script Purpose: 
	1) Keeping previous data type, only handling missing/wrong values 
	2) Exploring unique values of each column
	3) Text Normalization and Standardization
    
	e.g. 
		a column has values like ("Error", "Na", "", "n/a", NULL), i want to group them
        into one single value -> "Unknown"
===============================================================================
*/

select count(*) from staging;
-- 8807 ROWS

/* -------- SHOW_ID -------- */
select show_id from staging group by show_id having count(*) > 1;
-- every row is unique
-- show_id has the role of a unique id

/* -------- TYPE -------- */
select distinct type from staging;
-- No missing values


/* -------- TITLE -------- */
select title from staging where title = '' or title is NULL;
-- No missing values  

select count(distinct title) from staging;
-- 8800 distinct titles
-- => there are duplicates titles


/* -------- DIRECTOR -------- */
select director from staging where director is NULL;
select director from staging where director = '';
-- 2634 MISSING VALUES in the director column 

update staging
set director = 'Unknown'
where director = '';

update staging
set director = trim(trim(both ',' from director))
where director <> 'Unknown';

  
/* -------- CAST -------- */
select count(cast) from staging where cast is NULL;
select count(cast) from staging where cast = '';
-- 825 MISSING VALUES in the cast column 

update staging 
set cast = 'Unknown'
where cast = '';

update staging
set cast = trim(trim(both ',' from cast))
where cast <> 'Unknown';
 
 
/* -------- COUNTRY -------- */
select count(country) from staging where country is NULL;
select count(country) from staging where country = '';
-- 831 MISSING VALUES in the country column 

update staging
set country = 'Unknown'
where country is Null or country = '';

select show_id, country
from staging 
where country regexp '^,' or country regexp ',$';

update staging
set country = trim(trim(both ',' from country))
where country <> 'Unknown';


/* -------- DATE_ADDED -------- */
select date_added from staging where date_added is NULL;
select date_added from staging where date_added = '';
-- 10 MISSING VALUES

update staging
set date_added = NULL
where date_added = '';


/* -------- RELEASE_YEAR -------- */
 select count(release_year) from staging where release_year is NULL;
 select count(release_year) from staging where release_year = '';
-- NO MISSING VALUES


/* -------- DURATION -------- */
select count(duration) from staging where duration is NULL;
select count(duration) from staging where duration = '';
 -- 3 MISSING VALUES 
 
update staging  
set duration = 'Unknown'
where duration = '';


/* -------- LISTED_IN -------- */
select count(listed_in) from staging where listed_in is NULL;
select count(listed_in) from staging where listed_in = '';
-- NO MISSING VALUES in the listed_in column 
 
 
/* -------- DESCRIPTION -------- */
select count(description) from staging where description is NULL;
select count(description) from staging where description = '';
-- NO MISSING VALUES in the description column 
 