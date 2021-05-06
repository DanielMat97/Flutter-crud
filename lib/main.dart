import 'package:crud/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:crud/pages/login.dart';
import 'package:crud/pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new Login(),
          '/home': (BuildContext context) => new Home()
        });
  }
}
