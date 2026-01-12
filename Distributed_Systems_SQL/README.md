# Data Engineering & Relational Algebra: From ETL to Complex Queries

This module documents a complete data lifecycle: from the ingestion and cleansing of massive geographical datasets to the execution of high-level relational operations.

---

## Project Ecosystem

### 1. [Postal Data ETL Pipeline](./postal_data_etl_pipeline.ipynb)
The foundation of the repository. A Python-based ETL process that cleanses and normalizes the official Mexican Postal Code dataset.
* **Volume:** 155,000+ records handled.
* **Transformation:** Uses `pandas` and `unidecode` to solve encoding issues and special characters.
* **Schema:** Direct loading into the [mexico_postal_codes_schema.sql](./mexico_postal_codes_schema.sql), optimized with indexes for geographical lookups.

## Database Management & Workflow

The project follows a professional database administration workflow, utilizing **MariaDB** as the core engine and **DBeaver** for schema design and data visualization.

### MariaDB Implementation
* **Server Setup:** Configuration of local instances and user privileges for secure data ingestion.
* **Large Dataset Handling:** Optimization of server variables (such as `max_allowed_packet`) to ensure the successful import of the 155k+ postal records.
* **Schema Integrity:** Implementation of the [mexico_postal_codes_schema.sql](./mexico_postal_codes_schema.sql) through the command line to guarantee a clean relational structure.

### DBeaver Visualization & Analysis
* **ERD Design:** Generation and verification of Entity-Relationship Diagrams to validate normalization.
* **Query Performance:** Execution of stress tests and complex JOINs to ensure the database responds efficiently under load.
* **Data Auditing:** Direct monitoring of the ETL pipeline results through DBeaver's intuitive interface.


### 2. [Relational Algebra Exercises](./relational_algebra_excersises.sql)
Theoretical and mathematical implementation of database operations. 
* **Core Logic:** These exercises are built upon the data provided by the [complex_queries_lab.sql](./complex_queries_lab.sql).
* **Skills:** Mastery of Joins, Set Theory, and Projections to solve business logic problems.
* **Optimization:** Translation of algebraic expressions into efficient SQL execution plans.



---

## Tech Stack
* **Languages:** Python (Pandas), SQL (MariaDB/MySQL).
* **Key Skills:** Data Normalization, ETL Automation, Relational Mathematics, Query Performance.
* **Environment:** Linux-based database nodes.

---

## Future Updates: Distributed Systems
The following section is currently under refactoring to ensure full resilience and production-grade error handling:
- [ ] **Distributed Banking Admin Shell:** A professional CLI for multi-node management (Galera Cluster).
- [ ] **Atomic Transactions:** ACID-compliant banking logic.

*Status: In progress – Code release coming soon.*

---
*Developed as part of my Applied CS Data Journey | ENES Morelia, UNAM.*