import 'package:example_app/user/UserItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserTab extends StatefulWidget {
  final String title;
  final MaterialColor color;

  UserTab({Key key, this.title, this.color}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserTabState();
  }
}

class _UserTabState extends State<UserTab>
    with AutomaticKeepAliveClientMixin<UserTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Fluttertoast.showToast(msg: widget.title);
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Users",
                  textAlign: TextAlign.center,
                ),
              ),
              height: 50,
              width: double.infinity,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return UserItem();
              },
            )),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
