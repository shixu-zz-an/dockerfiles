from flask import Flask

app = Flask(__name__)

@app.route("/")
def health_check():
    return "Main Ops Container is running."

# 可扩展日志收集、监控等功能
@app.route("/collect_logs")
def collect_logs():
    return "Logs collected."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
