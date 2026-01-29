# app.py

from flask import Flask, jsonify
import threading
from consumer import consume_messages,messages
from processor import data_buffer

app = Flask(__name__)

@app.route('/status', methods=['GET'])
def status():
    return jsonify({"status": "running", "data_buffer_size": len(messages)})

@app.route('/test', methods=['GET'])
def test():
    return jsonify({"test": "success"})


if __name__ == '__main__':
    threading.Thread(target=consume_messages, daemon=True).start()
    app.run(debug=True,port=4000,host='172.16.0.13')
