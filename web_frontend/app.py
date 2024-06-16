import os
from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Database configuration
db2_uri = os.getenv('DB2_URI')
if not db2_uri:
    raise ValueError("No DB2_URI environment variable set")

app.config['SQLALCHEMY_DATABASE_URI'] = db2_uri
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# API server URL
api_server_url = os.getenv('API_SERVER_URL')
if not api_server_url:
    raise ValueError("No API_SERVER_URL environment variable set")

@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
