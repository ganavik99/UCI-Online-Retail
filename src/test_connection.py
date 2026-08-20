import psycopg2

DB_USER = "postgres"
DB_PASSWORD = "password"
DB_HOST = "localhost"
DB_PORT = 5432
DB_NAME = "ecommerce_analytics"

try:
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

    print("SUCCESS: PostgreSQL connection works!")

    conn.close()

except Exception as e:
    print("FAILED:")
    print(e)