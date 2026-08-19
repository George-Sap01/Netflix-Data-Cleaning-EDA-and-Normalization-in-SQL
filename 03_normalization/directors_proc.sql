-- procedure to fill directors and directors_shows tables
drop procedure if exists insert_directors;    

/*
	tables:
		clean_data 
        directors 
        directors_shows
*/

delimiter $$
create procedure insert_directors ()
begin 
	create temporary table if not exists temp(
			id int primary key not null auto_increment,
			show_id int not null,
            director_name varchar(100));
            
	-- in this table a have the show_id and the director's name
	insert into temp(show_id, director_name)
    with recursive cte as(
		select 
			id,
            concat(director, ',') as remaining,
            cast('' as char(500)) as token
		from clean_data
        UNION ALL
        select 
			id,
            substring(remaining, locate(',', remaining) + 1), 
            trim(substring_index(remaining, ',', 1))
		from cte
        where remaining != ''
    )
	select id, token 
    from cte 
    where token != '';
    
    -- insert director_name into directors table
    insert into directors(name) select distinct director_name from temp;

	-- insert ids into intermediate table
    insert into directors_shows(show_id, director_id)
		select distinct temp.show_id, directors.id
		from temp inner join directors on temp.director_name = directors.name;
    
    drop temporary table if exists temp;
end $$
delimiter ;