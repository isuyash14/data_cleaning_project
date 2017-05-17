# data_cleaning_project

This repository contains below direcorties in the 
data_cleaning_project/
		 -uncleaned_dataset/	contains ucleaned dataset
		 -cleaned_dataset/ 	contains cleaned dataset, openrefine history and narratives file for each dataset. 
		 -provenance_graphs/    contains code for the provenance_graphs and images for the YesWorkflow.
		 -sql_datalog/ 		contains sql and datalog files. 
					 
					 
-uncleaned_dataset/    	Uncleaned data set files before any cleaning operation is applied. 
-cleaned_dataset/
		+ Dish.csv		: Cleaned Dish dataset after cleaning operation has been performed. 
		+ Menu-cleaned.csv	: Cleaned Menu dataset after cleaning operation has been performed. 
		+ MenuItem.csv		: Cleaned MenuItem dataset after cleaning operation has been performed. 
		+ MenuPage.csv		: Cleaned MenuPage dataset after cleaning operation has been performed. 
		+ Menus Dataset.docx    : Narrative file of the cleaning operation performed for Menu dataset. 	
		+ OpenRefine_hist_Dish.txt	   : Openrefine history of operation for dish dataset. 
		+ OpenRefine_hist_Menu.txt	   : Openrefine history of operation for Menu dataset. 
		+ OpenRefine_hist_MenuItem.txt : Openrefine history of operation for MenuItem dataset. 
		+ OpenRefine_hist_MenuPage.txt : Openrefine history of operation for MenuPage dataset. 	

-provenance_graphs/ 
		+ Contains images for the YesWorkflow files and the codes containing the same. 
-sql_datalog/ 
		+SQL_Datalog.docx		: Narrative file for the SQL and datalog operations.  
		+create_tbl_load_data.sql	: Create table and load data script for the RDBMS schema created. 
		+datalog_facts_queries_icv.dlv	: datalog facts created from operations manual and openrefine history. 
						: It also contains queries and rules violation. 
		+queries.sql	: SQL queries for the intergrity constraints and functional dependency. 
				: Some additoinal sql queries for different insights about data as well. 
