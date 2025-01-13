import requests
from flask import Flask, request

app = Flask(__name__)

# 日志上报函数
def report_log(message):
    try:
        requests.post("http://main-ops:5000/log", json={"message": message})
    except Exception as e:
        print(f"Failed to report log: {e}")

@app.route("/query", methods=["POST"])
def query():
    input_text = request.json.get("text", "")
    report_log(f"LangChain received query: {input_text}")
    report_log(f"LangChain response: {response}")
    return {"response": response}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=7000)
