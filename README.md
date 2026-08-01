# 🎬 Netflix ETL Project

A beginner-friendly ETL project that extracts Netflix datasets from CSV files, performs basic data cleaning using Python, loads the data into PostgreSQL, and prepares an analytics table for visualization in Tableau.

This project demonstrates the fundamental ETL workflow that is commonly used in data engineering projects.

---

# 📌 Project Overview

The goal of this project is to practice building a simple ETL pipeline using Python and PostgreSQL.

The pipeline:

- Extracts multiple Netflix datasets from CSV files
- Cleans the data by removing duplicate records
- Loads the data into PostgreSQL
- Uses SQL to create summary tables
- Builds a final analytics table for a Tableau dashboard

---

# 🏗️ Project Workflow

```
Netflix CSV Files
       │
       ▼
Extract using Pandas
       │
       ▼
Basic Data Cleaning
(Remove Duplicates)
       │
       ▼
Load into PostgreSQL
       │
       ▼
SQL Aggregations
       │
       ▼
Movie Analysis Table
       │
       ▼
Tableau Dashboard
```

---

# 🛠️ Tech Stack

- Python
- Pandas
- PostgreSQL
- SQLAlchemy
- psycopg2
- SQL
- Tableau
- Jupyter Notebook
- Git & GitHub

---

# 📂 Dataset

The project uses four CSV datasets:

- 🎥 Movies
- ⭐ Ratings
- 👤 Users
- 📺 Watch History

These datasets are loaded into PostgreSQL where relationships are created for analysis.

---

# ⚙️ ETL Process

## 1. Extract

The notebook imports four CSV files using Pandas.

```python
pd.read_csv(...)
```

Datasets loaded:

- Movies
- Ratings
- Users
- Watch History

---

## 2. Transform

Basic cleaning is performed before loading the data.

Current transformations include:

- Removing duplicate records
- Inspecting missing values
- Validating dataset structure
- Reviewing data types

---

## 3. Load

The cleaned datasets are loaded into PostgreSQL using SQLAlchemy.

Tables created:

- Users
- Movies
- Ratings
- WatchHistory

Python's `to_sql()` method is used to populate the tables.

---

# 📊 SQL Analysis

After loading the data into PostgreSQL, SQL is used to build several summary tables for reporting.

### Watch Information

Combines:

- Users
- Movies
- Watch History

---

### Movie View Summary

Calculates:

- Total views
- Unique viewers
- Average watch hour

---

### Genre Summary

Calculates:

- Number of movies
- Total genre views
- Average release year

---

### Rating Summary

Calculates:

- Total ratings
- Average movie rating
- Number of 5-star ratings

---

### Final Analytics Table

A final `movie_analysis` table is created by joining all summary tables together.

This table is used as the data source for the Tableau dashboard.

---

# 📈 Dashboard

The Tableau dashboard provides insights such as:

- Most watched movies
- Highest rated movies
- Total views
- Average ratings
- Genre performance
- Viewer statistics

---

# 🚀 How to Run

## Clone the repository

```bash
git clone https://github.com/jasonbo9118/Netflix-ETL-Project.git
```

```bash
cd Netflix-ETL-Project
```

---

## Install dependencies

```bash
pip install pandas
pip install psycopg2-binary
pip install sqlalchemy
```

---

## Create PostgreSQL Database

Create a database named:

```
NETFLIX_DATABASE
```

Update the database credentials in the notebook if necessary.

---

## Run the Notebook

Run each notebook cell to:

- Load the CSV files
- Create PostgreSQL tables
- Insert the data
- Execute the SQL analysis

---

# 📚 Skills Demonstrated

- ETL Fundamentals
- Data Cleaning
- PostgreSQL
- SQL Joins
- SQL Aggregations
- Table Creation
- Data Loading with SQLAlchemy
- Relational Databases
- Tableau Dashboard Preparation
- Python (Pandas)

---

# 📁 Repository Structure

```
.
├── Netflix ETL.ipynb
├── Netflix SQL Postgres.sql
├── Source Data/
├── README.md
```

---

# 🔮 Future Improvements

- Add data validation checks
- Automate the ETL process into a Python script
- Containerize the project using Docker
- Schedule the pipeline with Apache Airflow
- Load data into a cloud data warehouse
- Expand the Tableau dashboard with additional KPIs

---

## 👨‍💻 Author

**Jason Bo Tonogbanua**

Building hands-on Data Engineering projects focused on Python, SQL, PostgreSQL, AWS, Spark, Snowflake, and modern data pipelines.