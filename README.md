# Supermarket Sales Analysis using SQL 🛒📊

This project analyzes a supermarket sales dataset using SQL to derive key business insights. It involves data transformation, feature engineering, and exploratory analysis to uncover trends in customer behavior, sales performance, and financial metrics.

---

## 🛠️ Tools Used

- **SQL (MySQL or PostgreSQL)**
- **DBMS: MySQL Workbench / pgAdmin / any SQL client**

---

## 📌 About the Project

The dataset includes transactional data such as product categories, customer demographics, date and time of purchase, payment method, ratings, and sales amount. The goal is to extract actionable insights to support decision-making across sales, marketing, inventory, and customer management.

---

## 🔍 Key Aspects of the Project

### 🧱 Feature Engineering

- **Time of Day Categorization**:
  - Morning (00:00–12:00)
  - Afternoon (12:01–16:00)
  - Night (16:01–23:59)

- **Day and Month Extraction**:
  - Extracted `day_name` and `month_name` for trend analysis.

---

### 📊 Business Insights & Queries

#### 🗺️ General Business Insights
- Number of unique cities in the dataset
- Branch locations by city

#### 🛍️ Product Analysis
- Count of unique product lines
- Most sold product line
- Highest revenue-generating product line

#### 💰 Revenue & Financial Metrics
- Revenue per month
- Month with highest COGS
- City with highest revenue
- Product line with highest VAT

#### 👥 Customer Insights
- Revenue by customer type (Member vs Normal)
- Most common customer type
- Gender-based purchasing patterns
- Gender distribution across branches
- Customer type with highest VAT contribution

#### ⏱️ Sales & Performance Metrics
- Sales volume by time of day
- Branches with above-average product sales
- Average rating per product line
- Time of day with most customer ratings

---

## 📈 Key Learnings

- Applied **advanced SQL queries**: `SUM`, `COUNT`, `AVG`, `CASE`, subqueries, and `JSON_TABLE`.
- Engineered meaningful **time-based features** for better trend analysis.
- Gained actionable insights for business optimization across departments.
- Demonstrated strong understanding of **data transformation** and **analytics** in SQL.

---

## 🚀 Getting Started

1. Import the dataset into your SQL environment.
2. Run feature engineering scripts to enrich the dataset.
3. Execute insights queries to extract business metrics and patterns.

