from flask import Flask

print("🔥 Starting Flask App...")

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello Kartik 🚀 Git Project Working!"

if __name__ == "__main__":
    app.run(debug=True)