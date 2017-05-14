
/* created date: 05/09/2017
 * author:       pratiks2
 * desc: 		 Create tables for the datacleaning project: NYPL MENUS
*/

-- Create DB 
--.open clean_menu_database.db

.mode column 
.header on 
.timer on 

-- Drop table initialy.
drop table menuitem;
drop table menupage;
drop table dish;
drop table menu;

--- CREATE table MENU 
Create table Menu 
(id integer PRIMARY KEY NOT NULL, 
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
 date  date,
 location text,
 location_type text,
 currency real,
 currency_symbol text,
 status text,
 page_count integer,
 dish_count integer,
 CHECK (status IN ("COMPLETE", "UNDER REVIEW"))
 );
 
--- Create table menupage
---- menu_id references id of menu table. 

Create table MenuPage
( id integer PRIMARY KEY NOT NULL,
 menu_id integer,
 page_number integer,
 image_id text,
 full_height real,
 full_width integer,
 uuid text,
 FOREIGN KEY(menu_id) REFERENCES menu(id)
 );

--- Create table menuitem
--- dish_id references id  of dish table. 
---- menu_page_id references id of menupage table.
create table menuitem
(id	integer PRIMARY KEY NOT NULL,
 menu_page_id integer,
 price integer,
 high_price	real,
 dish_id integer,
 created_at date,
 updated_at date,
 xpos real,
 ypos real,
 FOREIGN KEY(menu_page_id) REFERENCES menupage(id),
 FOREIGN KEY(dish_id) REFERENCES dish(id)
);

--- Create table dish
create table dish 
(
 id	integer PRIMARY KEY NOT NULL,
 Name text,
 description text,
 menus_appeared	text,
 times_appeared	text,
 first_appeared	Date,
 last_appeared date,
 lowest_price real,
 highest_price real
);
 

-- Set Mode 
.mode csv
.header on 
.timer on


-- Import dataset 
.import menu.csv menu 
.import menupage.csv menupage
.import menuitem.csv menuitem
.import dish.csv dish



