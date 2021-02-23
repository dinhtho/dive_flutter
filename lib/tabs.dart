import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirstTab extends StatefulWidget {
  String title;
  MaterialColor color;

  FirstTab({Key key, this.title, this.color}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FirstTabState();
  }
}

class _FirstTabState extends State<FirstTab> with AutomaticKeepAliveClientMixin<FirstTab> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(microseconds: 2000), () {
    //   Fluttertoast.showToast(msg: widget.title);
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Fluttertoast.showToast(msg: widget.title);
    return Container(color: widget.color);
  }

  @override
  bool get wantKeepAlive => true;
}
