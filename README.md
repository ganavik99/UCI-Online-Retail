# E-Commerce Sales & Returns Analytics

An end-to-end data analytics project analyzing e-commerce sales, customer behavior, product performance, geographic revenue, and product returns.

The project uses Python for data preparation, PostgreSQL for data storage and SQL analysis, and Power BI for interactive dashboard development.

---

## Project Overview

This project analyzes the UCI Online Retail dataset to identify key business trends and answer questions around:

- Revenue performance
- Monthly sales trends
- Product performance
- Customer revenue contribution
- Geographic sales performance
- Product returns
- Return-rate trends

The project demonstrates an end-to-end analytics workflow from raw data to business intelligence dashboard.

---

## Dataset

The project contains:

- **524,878 sales records**
- **9,251 return records**

The dataset is based on the UCI Online Retail dataset.

---

## Key Business Metrics

| KPI | Value |
|---|---:|
| Total Revenue | 10,642,110.80 |
| Net Revenue | 9,748,131.07 |
| Total Returns | 893,979.73 |
| Return Rate | 8.40% |
| Average Order Value | 533.17 |

---

## Technologies Used

### Data Processing
- Python
- Pandas

### Database
- PostgreSQL
- SQLAlchemy
- Psycopg2

### Data Analysis
- SQL
- DAX

### Visualization
- Microsoft Power BI

### Development Tools
- VS Code
- Git
- GitHub

---

## Project Workflow

```text
Raw UCI Dataset
       ↓
Python Data Cleaning
       ↓
Processed Data
       ↓
PostgreSQL Database
       ↓
SQL Business Analysis
       ↓
Power BI
       ↓
Interactive Dashboard



Power BI Dashboard

The dashboard provides an interactive view of sales and returns performance.

Dashboard Features
Total Revenue
Net Revenue
Average Order Value
Total Returns
Return Rate
Monthly Revenue Trend
Top 10 Countries by Revenue
Top 10 Products by Revenue
Top 10 Customers by Revenue
Monthly Return Rate
Year slicer
Country slicer


Dashboard Preview

<img width="2559" height="1383" alt="image" src="https://github.com/user-attachments/assets/580ac6b6-8dfd-48d8-a94c-1095ea0816d1" />


Key Analysis
Revenue Analysis

Monthly revenue trends were analyzed to identify periods of growth and decline.

Product Analysis

Top-performing products were identified based on total revenue.

Customer Analysis

High-value customers were ranked based on their contribution to total revenue.

Geographic Analysis

Revenue was analyzed across countries to identify the strongest markets.

Returns Analysis

Return value and return rate were analyzed over time to identify periods with elevated returns.

Project Structure
UCI-Online-Retail/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── src/
│   ├── clean_data.py
│   ├── load_database.py
│   └── test_connection.py
│
├── sql/
│
├── powerbi/
│   └── dashboard_screenshots/
│
├── README.md
├── requirements.txt
└── .gitignore


How to Run
1. Clone the repository
git clone https://github.com/ganavik99/UCI-Online-Retail.git
cd UCI-Online-Retail
2. Create a virtual environment
python -m venv venv

Activate it on Windows:

venv\Scripts\activate
3. Install dependencies
pip install -r requirements.txt
4. Configure PostgreSQL

Create a PostgreSQL database and update the database connection details in:

src/load_database.py
5. Load the data
python src/load_database.py


Business Insights

The analysis shows that:

The United Kingdom is the dominant revenue-generating market.
A relatively small number of products contribute significantly to revenue.
Revenue varies considerably across months.
High-value customers contribute a significant share of revenue.
Return rates vary substantially across the year.
Future Improvements
Add customer segmentation using RFM analysis
Add profit and margin analysis
Add product return-rate analysis
Add customer retention analysis
Add automated data refresh
Deploy the Power BI dashboard
Add machine-learning based sales forecasting
Author

Ganavi K

Data Analytics | Python | SQL | PostgreSQL | Power BI


