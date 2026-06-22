# 📊 Retail Sales Business Analysis using Python & PostgreSQL

## 🎯 Project Overview

This project focuses on analyzing retail sales data to uncover business insights related to revenue, profitability, product performance, regional trends, and year-over-year growth.

The project follows an end-to-end ETL and analytics workflow including data extraction, data transformation, data loading, and SQL-based business analysis.

---

## 🛠️ Tools & Technologies

* 🐍 Python
* 🐼 Pandas
* 🗄️ PostgreSQL
* 💻 pgAdmin
* 📓 Jupyter Notebook
* 📦 Kaggle API
* 📊 SQL
* 🔄 ETL Pipeline

---

## 🔄 Project Workflow

```text
Extract (Kaggle API)
        ↓
Transform (Python & Pandas)
        ↓
Feature Engineering
        ↓
Load (PostgreSQL)
        ↓
Business Analysis (SQL)
        ↓
Insights & Recommendations
```

---

## 🔄 ETL Process

### 📥 Extract

* Downloaded retail sales dataset using Kaggle API.
* Imported dataset into Jupyter Notebook for processing.

### 🔧 Transform

* Handled missing values.
* Standardized column names.
* Converted date columns into datetime format.
* Created additional business metrics:

  * Discount
  * Sale Price
  * Profit

### 📤 Load

* Loaded transformed dataset into PostgreSQL using SQLAlchemy.
* Created a structured database for business analysis.

---

## 📂 Dataset Information

The dataset contains retail order information including:

* Order Details
* Product Information
* Customer Segments
* Regional Information
* Pricing Data
* Discounts
* Profit Metrics

---

# 📈 Business Problems Solved

## 🏆 1. Top 10 highest Revenue Generating Products

### Business Question

Which products generate the highest revenue for the business?

### Business Value

Helps identify high-performing products and supports inventory planning and sales strategy.

### Output

<img width="222" height="215" alt="Screenshot 2026-06-21 223944" src="https://github.com/user-attachments/assets/4cef0ead-d10a-4050-99ec-ab266bdb958b" />



### Key Insight

A small number of products contribute significantly to overall business revenue.

---

## 🌎 2. Top 5 Revenue Generating Products by Region

### Business Question

Which products perform best within each region?

### Business Value

Supports region-specific marketing and product placement decisions.

### Output

(Add Screenshot Here)

### Key Insight

Customer preferences vary across regions, creating opportunities for targeted sales strategies.

---

## 📅 3. Year-over-Year Sales Comparison (2022 vs 2023)

### Business Question

How did monthly sales performance change from 2022 to 2023?

### Business Value

Measures business growth and identifies seasonal sales trends.

### Output

(Add Screenshot Here)

### Key Insight

Several months demonstrated stronger sales performance in 2023 compared to the previous year.

---

## 📦 4. Highest Sales Month by Category

### Business Question

Which month generated the highest sales for each category?

### Business Value

Helps forecast demand and optimize inventory planning.

### Output

(Add Screenshot Here)

### Key Insight

Each category exhibits distinct seasonal purchasing patterns.

---

## 📈 5. Highest Profit Growth Sub-Category

### Business Question

Which sub-category experienced the highest profit growth in 2023 compared to 2022?

### Business Value

Identifies high-growth business segments for future investment and expansion.

### Output

(Add Screenshot Here)

### Key Insight

Certain sub-categories significantly outperformed others in profitability growth.

---

# 🚀 Key Skills Demonstrated

✅ ETL Pipeline Development

✅ Data Extraction

✅ Data Cleaning

✅ Data Transformation

✅ Feature Engineering

✅ Data Loading

✅ PostgreSQL

✅ SQL Analytics

✅ Window Functions

✅ Common Table Expressions (CTEs)

✅ Conditional Aggregation

✅ Revenue Analysis

✅ Profitability Analysis

✅ Time Series Analysis

✅ Business Analysis

✅ Python Pandas

---

## 📁 Repository Structure

```text
retail-sales-business-analysis/
│
├── orders.csv
├── retail_orders.ipynb
├── retail db.sql
├── README.md
└── screenshots/
```

---

## 🎓 Learning Outcomes

Through this project, I gained hands-on experience in:

* Building ETL workflows using Python.
* Designing and querying PostgreSQL databases.
* Solving real-world business problems using SQL.
* Performing sales and profitability analysis.
* Applying window functions and advanced SQL concepts.
* Converting raw business data into actionable insights.

---

## 📌 Conclusion

This project demonstrates how Python and PostgreSQL can be combined to build an end-to-end analytics solution, transforming raw retail sales data into meaningful business insights that support data-driven decision-making.
