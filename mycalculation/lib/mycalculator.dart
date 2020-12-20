import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  MyCalculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double num1 = 0.0;
  String ketqua = "0";
  String _ketqua = "0";
  double num2 = 0.0;
  String pheptinh = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      num1 = 0.0;
      _ketqua = "0";
      pheptinh = "";
      num2 = 0.0;
    } else if (buttonText == "⌫") {
      _ketqua = _ketqua.substring(0, _ketqua.length - 1);
      if (_ketqua == "") {
        _ketqua = "0";
      }
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      num1 = double.parse(ketqua);
      pheptinh = buttonText;
      _ketqua = "0";
    } else if (buttonText == "=") {
      num2 = double.parse(ketqua);
      if (pheptinh == "+") {
        _ketqua = (num1 + num2).toString();
      }
      if (pheptinh == "-") {
        _ketqua = (num1 - num2).toString();
      }
      if (pheptinh == "×") {
        _ketqua = (num1 * num2).toString();
      }
      if (pheptinh == "÷") {
        _ketqua = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      pheptinh = "";
    } else {
      if (_ketqua == "0") {
        _ketqua = buttonText;
      } else {
        _ketqua = _ketqua + buttonText;
      }
    }
    print(_ketqua);
    setState(() {
      ketqua = double.parse(_ketqua).toString();
    });
  }

  //Tao giao dien

  Widget buildButton(String buttonText) {
    return new Expanded(
        child: new OutlineButton(
      padding: new EdgeInsets.all(24.0),
      child: new Text(
        buttonText,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        buttonPressed(buttonText);
      },
      textColor: Colors.black,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding:
                  new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(ketqua,
                  style: new TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ))),
          new Expanded(child: new Divider()),
          new Column(children: [
            new Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("÷")
            ]),
            new Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("×")
            ]),
            new Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),
            new Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("000"),
              buildButton("+")
            ]),
            new Row(children: [
              MaterialButton(
                child: new Text("CLEAR",
                    style: new TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
                padding:
                    new EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                color: Colors.redAccent,
                onPressed: () {
                  buttonPressed("CLEAR");
                },
              ),
              MaterialButton(
                child: new Text("⌫",
                    style: new TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold)),
                padding:
                    new EdgeInsets.symmetric(vertical: 14.0, horizontal: 45.0),
                color: Colors.white,
                onPressed: () {
                  buttonPressed("⌫");
                },
              ),
              MaterialButton(
                child: new Text(
                  "=",
                  style: new TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                padding:
                    new EdgeInsets.symmetric(vertical: 14.0, horizontal: 60.0),
                color: Colors.greenAccent,
                onPressed: () {
                  buttonPressed("=");
                },
              ),
            ]),
          ])
        ])));
  }
}
