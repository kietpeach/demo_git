import 'package:flutter/material.dart';
import 'basic_provider.dart';
import 'changenotifier_provider.dart';
import 'multi_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      theme: ThemeData(primaryColor: Colors.blue),
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Demo provider"),
        ),
        body: DemoChangenotifierProvider(),
      )),
    );
  }
}
