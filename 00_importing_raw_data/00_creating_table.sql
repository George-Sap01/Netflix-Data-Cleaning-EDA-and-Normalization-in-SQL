/*
===============================================================================
DDL Script: Create Table
===============================================================================
Script Purpose:
    This script creates a table to import the raw data fron the csv file
	Import my raw CSV into a table where every column is text. This ensures nothing gets rejected during the initial upload.
===============================================================================
*/


drop table if exists dirty_netflix;
create table if not exists dirty_netflix(
	show_id text,
    type text,
    title text,
    director text,
    cast text,
    country text,
    date_added text,
    release_year text,
    rating text,
    duration text,
    listed_in text, 
    description text
);

