# SQL Advanced Analytics: Relational Foundations & Data Pipelines

This directory serves as a specialized module within my **Applied CS Data Journey**. It bridges the gap between theoretical **Relational Algebra** and professional **Data Engineering**, demonstrating how to manage large-scale datasets while ensuring high-level data consistency and system reproducibility.

---

## Project Architecture

The repository is structured to showcase a progression from core relational logic to complex analytical implementations:

### 1. [Data Engineering & ETL](postal_data_etl_pipeline.ipynb)
Focuses on the automation of data ingestion and large-scale record management.
* **Core Project:** Mexico's National Postal Directory.
* **Key Features:**
    * **Automated Ingestion:** Processing a production-grade dump of **155,857 records**.
    * **String Normalization:** Using `unidecode` to standardize complex Spanish phonetics (Ñ, accents) for search optimization.
    * **Interactive Tools:** CLI-based search engine for real-time address retrieval.

### 2. [Advanced Relational Logic](relational_algebra_exercises.sql)
Implementation of set theory operations translated into optimized SQL queries.
* **Key Operations:**
    * **Set Theory:** Utilization of `UNION` and `JOIN` logic to bridge disparate data sources.
    * **Temporal Analytics:** Calculation of student age averages and record antiquity using `TIMESTAMPDIFF` and `CURDATE`.
    * **Extreme Value Detection:** Using nested subqueries to identify outliers in cinema and academic datasets.

### 3. [Complex Database Design](complex_queries_lab.sql)
A multi-domain environment designed to test relational constraints and data integrity across interconnected schemas.
* **Schemas:** Cinema Industry (Directors/Movies), Pet Management (Owners/Pets), and Academic Records.
* **Focus:** Referential integrity, foreign key mapping, and complex data relationship management.

---

## Global Tech Stack
* **Database Engine:** MariaDB (10.11+).
* **Database Management:** DBeaver (Universal Database Tool).
* **Programming:** Python 3.10 (via Conda environments).
* **ORM & Connection:** SQLAlchemy, PyMySQL.
* **Data Processing:** Pandas, Unidecode.
* **Security:** Python-dotenv (for Environment Variable management).

---

## Analytical Highlights

| Component | Technology | Implementation | Impact |
| :--- | :--- | :--- | :--- |
| **ETL Pipeline** | Python / MariaDB | **155k+ Records** | Scalable Data Ingestion |
| **Search Engine** | Pandas / Unidecode | Text Normalization | 100% Matching Accuracy |
| **Complex Queries** | MariaDB | Subqueries & Joins | Advanced Business Logic |
| **Set Operations** | SQL | `UNION` / `LEFT JOIN` | Data Relationship Discovery |

---

## How to Navigate
1.  **Infrastructure:** Initialize your local MariaDB server and execute `complex_queries_lab.sql` followed by `mexico_postal_codes_schema.sql`.
2.  **Environment:** Create a `.env` file based on the provided template to manage your local database credentials securely.
3.  **Analysis:** Open the `postal_data_etl_pipeline.ipynb` for the full Python-SQL integration experience.
4.  **Exercises:** Explore `relational_algebra_exercises.sql` for advanced query examples and relational proofs.
