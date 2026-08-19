/*
===============================================================================
Script Purpose: 		
        -- Calculate percentege of missing values 
        
		Conclusion:
			No mode imputation for columns with high percentage of missing values.
            No deleting rows due to loss of valuable information.
===============================================================================
*/
   

/* ---------- TITLE ---------- */     
select concat( round(count(title) / (select count(title) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where title = "Unknown";
-- 0.01 % %
select * from clean_data where title = 'Unknown';
-- There is one actual movie calles 'Unknown'


/* ---------- DIRECTOR ---------- */     
select concat( round(count(director) / (select count(director) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where director = "Unknown";
-- 29.91 % %
select count(*) from clean_data where director = 'Unknown';
-- 2634

/* ---------- CAST ---------- */     
select concat( round(count(cast) / (select count(cast) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where cast = "Unknown";
-- 9.37 % %
select count(*) from clean_data where cast = 'Unknown';
-- 825 values 

/* ---------- COUNTRY ---------- */     
select concat( round(count(country) / (select count(country) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where country = "Unknown";
-- 9.44 % %
select count(*) from clean_data where country = 'Unknown';
-- 831 values 


/* ---------- RELEASE_YEAR ---------- */     
select concat( round(count(release_year) / (select count(release_year) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where release_year is NULL;
-- 0.00 %
select count(*) from clean_data where release_year is NULL;
-- 0 values 

/* ---------- DATE_ADDED ---------- */     
select concat( round(count(date_added) / (select count(date_added) from clean_data) * 100, 2), " %") as "percent of missing values" 
from clean_data
where date_added is NULL;
-- 0.00 %
select count(*) from clean_data where date_added is NULL;
-- 10 values 
