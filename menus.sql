/*
Create table Menu 
( Id tex t, 
 name text,
 sponsor text,
 event text,
 venue text,
 place text,
 physical_description text,
 occasion text,
 notes text,
 call_number text,
 keywords text,
 language text,
 date Date,
 location text,
 location_type text,
 currency real,
 currency_symbol text,
 status text,
 page_count integer ,
 dish_count integer
 );
*/
--.import FILE Table 
.mode csv
.import Menu.csv Menu 
.import Menupage.csv MenuPage
.import Menuitem.csv Menuitem
.import Dish.csv Dish

select d.name,m.name, m.event
  from dish d, menupage mp, menuitem mi, menu m
  where m.id=mp.menu_id
  and mp.id = mi.menu_page_id
  and mi.dish_id=d.id ;
  
  
select d.name,count(m.name),count(m.event)
  from dish d, menupage mp, menuitem mi, menu m
  where m.id=mp.menu_id
  and mp.id = mi.menu_page_id
  and mi.dish_id=d.id 
  and upper(m.event) like '%BREAKF%' 
  group by d.name, m.name,m.event
  having count(m.name) > 10
  order by 2 asc;
  
  
select d.name,min(d.first_appeared), m.name,m.location,m.event
  from dish d, menupage mp, menuitem mi, menu m
  where m.id=mp.menu_id
  and mp.id = mi.menu_page_id
  and mi.dish_id=d.id 
  and upper(d.name) like '%PIZZA%'
  and length(d.first_appeared)>3
  
  
  group by d.name, first_appeared
  order by asc;