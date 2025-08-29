from flask import Flask

app = Flask(__name__)
@app.route('/')


def hello():
    return "hello guys this is our first flask app"

if __name == '__main__'
    app.run(host='0.0.0.0',port=5000)    