# from flask import Flask, request, jsonify
# import requests
# import os
# from ibm_db import connect, exec_immediate, fetch_assoc

# app = Flask(__name__)

# # DB config
# db2_conn_str = os.getenv('DB2_CONN_STR')
# conn = connect(db2_conn_str, "", "")

# @app.route('/api/data', methods=['GET'])
# def get_data():
#     # Flask App Request
#     api_server_url = os.getenv('API_SERVER_URL')
#     response = requests.get(f"{api_server_url}/some-endpoint")
#     data = response.json()

#     # DB Query
#     sql = "SELECT * FROM some_table"
#     stmt = exec_immediate(conn, sql)
#     result = fetch_assoc(stmt)

#     return jsonify({
#         "api_data": data,
#         "db2_data": result
#     })

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=5001)


from flask import Flask, request, jsonify
import requests
import os
import logging
from ibm_db import connect, exec_immediate, fetch_assoc, conn_errormsg

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# DB config
db2_conn_str = os.getenv('DB2_CONN_STR')
if not db2_conn_str:
    logger.error("DB2_CONN_STR environment variable not set")
    raise ValueError("DB2_CONN_STR environment variable not set")

try:
    conn = connect(db2_conn_str, "", "")
    logger.info("Successfully connected to DB2 database")
except Exception as e:
    logger.error(f"Error connecting to DB2 database: {conn_errormsg()}")
    raise

@app.route('/api/data', methods=['GET'])
def get_data():
    # Flask App Request
    api_server_url = os.getenv('API_SERVER_URL')
    if not api_server_url:
        logger.error("API_SERVER_URL environment variable not set")
        return jsonify({"error": "API_SERVER_URL environment variable not set"}), 500

    try:
        response = requests.get(f"{api_server_url}/some-endpoint")
        response.raise_for_status()
        data = response.json()
    except requests.RequestException as e:
        logger.error(f"Error fetching data from API: {e}")
        return jsonify({"error": "Error fetching data from API"}), 500

    # DB Query
    sql = "SELECT * FROM some_table"
    try:
        stmt = exec_immediate(conn, sql)
        result = fetch_assoc(stmt)
    except Exception as e:
        logger.error(f"Error executing DB query: {e}")
        return jsonify({"error": "Error executing DB query"}), 500

    return jsonify({
        "api_data": data,
        "db2_data": result
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
