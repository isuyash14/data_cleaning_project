
/* created date: 05/09/2017
 * author:       pratiks2
 * desc: 		 SQL Queries for the datacleaning project: NYPL MENUS
*/

--set mode
.mode column
.header on 
.timer on


-- Count number of rows for each table. 

select count(1) as "Total Values: Menu" from menu; 
select count(1) as "Total Values: Menupage" from menupage; 
select count(1) as "Total Values: Menuitem" from menuitem; 
select count(1) as "Total Values: dish" from dish; 

-- Count number of nulls for names, sponsor, location for menu table. 
select count(1) as "Total Values: Menu" from menu where name=''; 
select count(1) as "Total Values: Menu" from menu where sponsor=''; 
select count(1) as "Total Values: Menu" from menu where place='';

-- Count number of null values for menu_id, page_number in menupage  table. 
select count(1) as "Total Values: Menupage" from menupage where menu_id=''; 
select count(1) as "Total Values: Menupage" from menupage where page_number=''; 

-- Count number of null values for price, high_price in menuitem  table. 
select count(1) as "Total Values: Menuitem" from menuitem where price=''; 
select count(1) as "Total Values: Menuitem" from menuitem where high_price=''; 

-- Count number of null values for name,menus_appeared,times_appeared, page_number in disg  table. 
select count(1) as "Total Values: dish" from dish where name=''; 
select count(1) as "Total Values: dish" from dish where menus_appeared=''; 
select count(1) as "Total Values: dish" from dish where times_appeared=''; 



-- Functional Dependencies-- 


-- Number of menu_id present in Menupage but not in menu. 
select count(distinct mp.menu_id)
 from menupage mp 
 left join menu m on m.id = mp.menu_id
 and m.id is null; 
 
-- Number of menu_page_id present in menuitem but not in menupage. 
select count(distinct mi.menu_page_id)
 from  menuitem mi
 left join menupage mp on mi.menu_page_id = mp.id
 and mp.id is null; 
 

-- Number of dishes  present in dish but not in menuitem. 
select count(distinct d.id)
 from  dish d
 left join menuitem mi on mi.dish_id = d.id
 and mi.dish_id is null; 


-- Value difference for the page_count for each menu and menu page. 

select m.page_count, mp.page_count, m.page_count-mp.page_count as diff
from menu m , (select menu_id, count(page_number) as page_count from menupage group by menu_id) mp 
where m.id=mp.menu_id 
and (m.page_count-mp.page_count) !=0;

-- The difference in the menus_appeared col for the dish and count of menus in which dish appeared. 
 select d.name,d.menus_appeared, md.menu_count, d.menus_appeared - md.menu_count
 from dish d,
 (
	select d.id id, count(m.name) as menu_count 
		from dish d, menu m, menupage mp, menuitem mi
	where d.id =mi.dish_id 
		and mp.id = mi.menu_page_id 
		and m.id=mp.menu_id 
		group by d.name, m.name
  ) md 
 where md.id = d.id
 and  (d.menus_appeared - md.menu_count) !=0
 order by menu_count desc, menus_appeared desc
 limit 100;
 
 
--- Average price of a dish containing coffee each year.

select  d.first_appeared,avg(mi.price)
	from dish d, menuitem mi 
		where d.name like '%COFFEE%' 
		and mi.dish_id = d.id 
		and d.first_appeared is not null
		group by d.first_appeared
		order by first_appeared ;

--- Average price of a dish containing PIZZA each year.

select  d.first_appeared,avg(mi.price)
	from dish d, menuitem mi 
		where d.name like '%PIZZA%' 
		and mi.dish_id = d.id 
		and d.first_appeared is not null
		group by d.first_appeared
		order by first_appeared ;
