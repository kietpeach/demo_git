import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increase() {
    _count++;
    notifyListeners();
  }

  decrease() {
    _count--;
    notifyListeners();
  }
}

class Counter1 with ChangeNotifier {
  int _count = 10;
  int get count => _count;
  increase() {
    _count++;
    notifyListeners();
  }

  decrease() {
    _count--;
    notifyListeners();
  }
}

class DemoMultiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => Counter1())
      ],
      child: TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>((context));
    Counter1 counter1 = Provider.of<Counter1>((context));
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter1.count.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Increase",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  counter.increase();
                  counter1.increase();
                }),
            RaisedButton(
                color: Colors.red,
                child: Text(
                  "Decrease",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  counter.decrease();
                  counter1.decrease();
                }),
            RaisedButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
