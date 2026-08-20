import os
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# --------------------------------------------------
# 1. PostgreSQL connection details
# --------------------------------------------------

DB_USER = "postgres"
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = "localhost"
DB_PORT = 5432
DB_NAME = "ecommerce_analytics"

connection_url = URL.create(
    drivername="postgresql+psycopg2",
    username=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT,
    database=DB_NAME
)

engine = create_engine(connection_url)

# --------------------------------------------------
# 2. Load cleaned CSV files
# --------------------------------------------------

sales_file = "data/processed/clean_sales.csv"
returns_file = "data/processed/returns.csv"

sales = pd.read_csv(
    sales_file,
    dtype={
        "InvoiceNo": str,
        "StockCode": str,
        "CustomerID": str
    }
)

returns = pd.read_csv(
    returns_file,
    dtype={
        "InvoiceNo": str,
        "StockCode": str,
        "CustomerID": str
    }
)

print("Sales records loaded:", len(sales))
print("Return records loaded:", len(returns))

# --------------------------------------------------
# 3. Load Sales into PostgreSQL
# --------------------------------------------------

print("\nLoading sales data...")

sales.to_sql(
    "sales",
    engine,
    if_exists="replace",
    index=False,
    chunksize=5000
)

print("Sales data loaded successfully.")

# --------------------------------------------------
# 4. Load Returns into PostgreSQL
# --------------------------------------------------

print("\nLoading returns data...")

returns.to_sql(
    "returns",
    engine,
    if_exists="replace",
    index=False,
    chunksize=5000
)

print("Returns data loaded successfully.")

# --------------------------------------------------
# 5. Finish
# --------------------------------------------------

print("\nData loading completed!")