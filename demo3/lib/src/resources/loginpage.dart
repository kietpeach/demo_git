import 'package:demo3/src/resources/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  String _userNameError = "Tài khoản không hợp lệ";
  String _passWordError = "Mật khẩu phải trên 6 kí tự";
  bool _userInvalid = false;
  bool _passInvalid = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(30),
            constraints: BoxConstraints.expand(),
            color: Theme.of(context).primaryColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Center(
                      child: Container(
                          width: 70,
                          height: 70,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: FlutterLogo()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Text(
                      "Hello\nWelcome Flutter App",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TextField(
                      controller: _userController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "USERNAME",
                          errorText: _userInvalid ? _userNameError : null,
                          labelStyle:
                              TextStyle(color: Colors.blue[300], fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          TextField(
                            controller: _passController,
                            obscureText: !_showPass,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "PASSWORD",
                                errorText: _passInvalid ? _passWordError : null,
                                labelStyle: TextStyle(
                                    color: Colors.blue[300], fontSize: 15)),
                          ),
                          GestureDetector(
                            onTap: onTapShowPassword,
                            child: Text(
                              _showPass ? "HIDE" : "SHOW",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: onSignInTap,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NEW USER? SIGN UP",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Text(
                          "FORGOT PASSWORD?",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapShowPassword() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInTap() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }
      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      if (!_userInvalid && !_passInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
}
