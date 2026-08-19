/*
===============================================================================
Script Utility: 		
    
    This script makes sense only when:
    1) Run creating_tables_for_normalization.sql script
    2) Create each procedure using its script
    3) Finaly run this script 
===============================================================================
*/
   

-- calling procedures

call insert_actors();
call insert_directors();
call insert_countries();
call insert_categories();