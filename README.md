# zepto-sql-analysis-
# 🛒 Zepto SQL Data Analysis Project

## 📌 Overview

This project focuses on analyzing product-level data from Zepto using SQL.
The goal is to extract meaningful business insights such as pricing trends, discounts, inventory distribution, and product availability.

---

## 📂 Dataset

The dataset contains information about products, including:

* Category
* Product Name
* MRP (Maximum Retail Price)
* Discount Percentage
* Available Quantity
* Discounted Selling Price
* Weight (in grams)
* Stock Availability

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* GitHub (for version control)

---

## 📊 Key Business Questions Solved

### 🔹 1. Top 10 best-value products based on discount

Identified products offering the highest discount percentages.

### 🔹 2. High MRP but Out-of-Stock Products

Analyzed expensive products that are currently unavailable.

### 🔹 3. Estimated Revenue per Category

Calculated potential revenue using:
`discounted price × available quantity`

### 🔹 4. Premium Products with Low Discount

Filtered products where:

* MRP > ₹500
* Discount < 10%

### 🔹 5. Top Categories by Average Discount

Used aggregation to find categories offering the best discounts.

### 🔹 6. Price per Gram Analysis

Computed value for money using:
`price / weight`

### 🔹 7. Product Segmentation

Grouped products into:

* Low
* Medium
* Bulk

### 🔹 8. Total Inventory Weight per Category

Calculated total weight using:
`weight × quantity`

---

## 🧾 Sample SQL Query

```sql
SELECT category,
ROUND(AVG(discount_percent), 2) AS avg_discount
FROM Zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;
```

---

## 📈 Key Insights

* Categories with bulk products contribute the most to total inventory weight.
* Some high-MRP products are frequently out of stock.
* Discount strategies vary significantly across categories.
* Price-per-gram analysis helps identify best-value products.

---

## 🚀 How to Use

1. Import the dataset into your SQL database.
2. Run the `schema.sql` file to create the table.
3. Execute queries from `queries.sql` to reproduce results.

---

## 📁 Project Structure

```
zepto-sql-analysis/
│
├── schema.sql
├── queries.sql
├── zepto_v2.csv
└── README.md
```

---

## 🎯 Learning Outcome

This project demonstrates:

* SQL query writing (SELECT, WHERE, GROUP BY, ORDER BY)
* Data cleaning and transformation
* Business-oriented data analysis
* Problem-solving using real-world datasets

---

## 👨‍💻 Author

SAI MORE

---
