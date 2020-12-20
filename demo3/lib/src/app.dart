import 'package:demo3/src/resources/loginpage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueGrey[100]),
        home: LoginPage());
  }
}
