from flask import Flask, request, jsonify
import requests
import os
from ibm_db import connect, exec_immediate, fetch_assoc

app = Flask(__name__)

# DB config
db2_conn_str = os.getenv('DB2_CONN_STR')
conn = connect(db2_conn_str, "", "")

@app.route('/api/data', methods=['GET'])
def get_data():
    # Flask App Request
    api_server_url = os.getenv('API_SERVER_URL')
    response = requests.get(f"{api_server_url}/some-endpoint")
    data = response.json()

    # DB Query
    sql = "SELECT * FROM some_table"
    stmt = exec_immediate(conn, sql)
    result = fetch_assoc(stmt)

    return jsonify({
        "api_data": data,
        "db2_data": result
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
