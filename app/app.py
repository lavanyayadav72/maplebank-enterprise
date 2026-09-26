import os
import pyodbc
from flask import Flask, jsonify

app = Flask(__name__)


def get_connection():
    connection_string = (
        "DRIVER={ODBC Driver 18 for SQL Server};"
        f"SERVER={os.environ['DB_SERVER']};"
        f"DATABASE={os.environ['DB_NAME']};"
        f"UID={os.environ['DB_USER']};"
        f"PWD={os.environ['DB_PASSWORD']};"
        "Encrypt=yes;"
        "TrustServerCertificate=no;"
        "Connection Timeout=5;"
    )

    return pyodbc.connect(connection_string)


@app.get("/health")
def health():
    return jsonify({"status": "healthy"})


@app.get("/accounts")
def accounts():
    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "SELECT id, name, balance FROM dbo.Accounts ORDER BY id"
        )

        accounts = [
            {
                "id": row.id,
                "name": row.name,
                "balance": float(row.balance)
            }
            for row in cursor.fetchall()
        ]

        cursor.close()
        conn.close()

        return jsonify(accounts)

    except Exception as e:
        app.logger.exception("Database query failed")
        return jsonify({"error": "Database unavailable"}), 503


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)