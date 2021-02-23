import 'package:example_app/tabs.dart';
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
      home: MyHomePage(title: 'My Practices'),
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
        FirstTab(title:"tab1",color: Colors.red,),
        FirstTab(title:"tab2",color: Colors.green),
        FirstTab(title:"tab3",color: Colors.blue),
        FirstTab(title:"tab4",color: Colors.yellow)
      ],
    );
  }
}