import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  String _name;
  String get name => _name;
  set name(newName) => _name = newName;
}

class BasicProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = new User();
    user.name = "Kiet111";
    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [DemoProviderConsumer(), DemoProviderWithoutConsumer()],
      ),
    );
  }
}

class DemoProviderConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, child) => Text(user.name));
  }
}

class DemoProviderWithoutConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
}
