# Rockbuster Stealth SQL Data Analysis Project

## 📌 Overview
This project uses SQL only to analyze the fictional **Rockbuster Stealth LLC** movie rental business. The objective is to generate insights to guide the company’s transition into an **online video rental service**.

## 🎯 Business Goals
Rockbuster’s management needs **data-driven insights** to:
- Identify **top-performing movies** and **underperforming titles**.
- Understand **customer behavior** based on rental activity.
- Determine **regional market trends** to optimize expansion strategies.

## 📂 Project Structure
### 📊 **SQL Queries**
The repository includes several key SQL queries:

| File | Description |
|------|------------|
| `01_film_table_statistics.sql` | Analyzes movie performance by revenue and rental count. |
| `02_customer_table_statistics.sql` | Provides customer insights, including retention and lifetime value. |
| `03_top10_countries.sql` | Identifies the top 10 revenue-generating countries. |
| `04_top10_cities.sql` | Analyzes customer concentration at the city level. |
| `05_top5_customers.sql` | Lists the highest-value customers based on total rentals. |

### 📑 **Documentation**
- **`00_Data_Project_Brief.pdf`** - Defines the business problem and objectives.
- **`10_Data_Dictionary_Movie_Rental_Database.pdf`** - Explains the database schema, relationships, and business rules.
- **`00_Rockbuster_database.tar`** - PostgreSQL dump file to restore the database.

## 🛠️ **Setting Up the Database**
#### Step 1: Install PostgreSQL**
Ensure PostgreSQL is installed on your system:
```bash
sudo apt update && sudo apt install postgresql
```
#### Step 2: Restore the Database
Load the provided database dump:
```bash
psql -U username -d rockbuster_db -f 00_Rockbuster_database.tar
```
#### Step 3: Run SQL Queries
Once the database is set up, execute the SQL scripts in the correct order:
```bash
psql -U username -d rockbuster_db -f 01_film_table_statistics.sql
psql -U username -d rockbuster_db -f 02_customer_table_statistics.sql
```
## 🚀 Why This Repository is Valuable
- Demonstrates SQL expertise with real-world business applications.
- Provides structured SQL queries for analyzing customer behavior, revenue, and geographic trends.
- Includes full documentation to guide replication of the analysis.
