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

  reset() {
    _count = 0;
    notifyListeners();
  }
}

class DemoChangenotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Counter(), child: TestWidget());
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>((context));
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                }),
            RaisedButton(
                color: Colors.red,
                child: Text(
                  "Decrease",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  counter.decrease();
                }),
            RaisedButton(
                color: Colors.grey,
                child: Text("Reset"),
                onPressed: () {
                  counter.reset();
                })
          ],
        ),
      ),
    );
  }
}
