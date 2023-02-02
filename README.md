This file shows all the steps that needs to be followed to create the tables, ingest the data, and run the queries on PostgreSQL database

Step 1: Create the tables and ingest the data. 
Place all the csv files at a single location in the computer and copy the path of that location and place it in the 'creating_tabels_and_ingesting_data.sql' file.
Open a SQL editor in PostgreSQL database and run the commands mentioned in the 'creating_tabels_and_ingesting_data.sql' file.
Running these commands will create 4 tables and ingest the data in the csv file to these tables

Step 2: Run the queries to get the results of the business questions
Copy the queries written below the business questions in queries.sql file to get the output of the questions 
Run the queries in SQL editor in PostgreSQL see the outputs in 'Data Output' pane

File Structure & Interpretation

Data Model.jpg -> This file shows the data model, joinable keys, and data types for the data to be ingested in a data warehouse
Documentation.docx -> This file lays down the concepts, steps followed, and insights for the data model, SQL questions, and business report
creating_tables_and_ingesting_data.sql -> This file contains the commands to be executed on PostgreSQL to create the tables and ingest the data
queries.sql -> This file contains the commands to be executed to get the results of the SQL questions
Queries_And_Output_Document.docx -> This file contains the queries and the respective outputs executed in PostgreSQL
visualization_link.txt -> This file contains a link to a Google Sheet Visualization that gives insights regarding potential business questions
