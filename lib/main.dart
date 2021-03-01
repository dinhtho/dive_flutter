import 'package:example_app/user/user_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: SafeArea(
        child: MyHomePage(title: 'My Practices'),
      )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        UserTab(
          title: "tab1",
          color: Colors.red,
        ),
        UserTab(title: "tab2", color: Colors.green),
        UserTab(title: "tab3", color: Colors.blue),
        UserTab(title: "tab4", color: Colors.yellow)
      ],
    );
  }
}
