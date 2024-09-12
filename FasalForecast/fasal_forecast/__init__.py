from flask import Flask, jsonify
import requests
import os

app = Flask(__name__)

UPLOAD_FOLDER = os.path.join(os.getcwd(), 'static/uploads')

# checking if dir exits
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

# Configure upload folder
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

from fasal_forecast import routes