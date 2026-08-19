/*
===============================================================================
Script Purpose: 
	Creating Tables for Normalization
===============================================================================
*/

set foreign_key_checks = 0;

-- CREATING THE shows TABLE
drop table if exists shows;
create table if not exists shows(
	id 			 int 					  primary key not null auto_increment unique,
    type 		 enum('Movie', 'TV Show') not null, 
    title 		 varchar(150) 			  not null,
    date_added 	 date,
    release_year int,
    duration 	 varchar(50) 			  not null,
    description  text not 				  null
);

insert into shows(type, title, date_added, release_year, duration, description) 
	select type, title, date_added, release_year, duration, description from clean_data;

-- CREATING THE directors TABLE 
drop table if exists directors;
create table if not exists directors(
	id 		int 		  auto_increment primary key unique not null,
    name 	varchar(150)  unique not null
);

-- CREATING THE "MIDDLE"/CONNECTING TABLE BETWEEN directors AND shows 
drop table if exists directors_shows;
create table if not exists directors_shows(
    show_id 	int not null,
    director_id int not null, 
    constraint directors_shows_pk primary key (show_id, director_id),
	constraint directors_shows_shows_fk foreign key (show_id) references shows(id) on delete cascade,
    constraint directors_shows_directors_fk foreign key (director_id) references directors(id) on delete cascade
);

-- CREATING actors TABLE 
drop table if exists actors;
create table if not exists actors(
	id 	 int 		  primary key auto_increment not null,
    name varchar(300) unique not null
);

-- CREATING THE "MIDDLE"/CONNECTING TABLE BETWEEN actors AND shows
drop table if exists actors_shows;
create table if not exists actors_shows(
    show_id 	int not null,
    actor_id 	int not null, 
    constraint actors_shows_pk primary key (show_id, actor_id),
	constraint actors_shows_shows_fk foreign key (show_id) references shows(id) on delete cascade,
    constraint actors_shows_actosr_fk foreign key (actor_id) references actors(id) on delete cascade
);

-- CREATING THE countries TABLE
drop table if exists countries;
create table if not exists countries(
	id 	 int 		  primary key auto_increment not null,
    name varchar(200) unique not null
);

-- CREATING THE "MIDDLE"/CONNECTING TABLE BETWEEN countries AND shows 
drop table if exists countries_shows;
create table if not exists countries_shows(
    show_id 	int not null,
    country_id int not null,
    constraint countries_shows_pk primary key (show_id, country_id),
	constraint countries_shows_shows_fk foreign key (show_id) references shows(id) on delete cascade,
    constraint countries_shows_countrys_fk foreign key (country_id) references countries(id) on delete cascade
);

-- CREATING THE categories TABLE
drop table if exists categories;
create table if not exists categories(
	id 	 int 		  primary key auto_increment not null,
    name varchar(200) unique not null
);

-- CREATING THE "MIDDLE"/CONNECTING TABLE BETWEEN categories AND shows  
drop table if exists categories_shows;
create table if not exists categories_shows(
    show_id 	int not null,
    category_id int not null, 
    constraint categories_shows_pk primary key (show_id, category_id),
	constraint categories_shows_shows_fk foreign key (show_id) references shows(id) on delete cascade,
    constraint categories_shows_categories_fk foreign key (category_id) references categories(id) on delete cascade
);

set foreign_key_checks = 1;
