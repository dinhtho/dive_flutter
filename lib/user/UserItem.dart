import 'package:example_app/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserItemState();
  }
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 5, bottom: 8, right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://464697-1455876-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/05/Vanja_Bertalan_Human_CEO_1-750x375.jpg"),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jon Street",
                  style: ThemeText.bold.copyWith(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      "Reputation",
                      style: ThemeText.bold.copyWith(color: Colors.grey),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Text(
                        "1234454",
                        style: ThemeText.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Location",
                      style: ThemeText.bold.copyWith(color: Colors.grey),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3),
                      child: Text(
                        "Reading,UK",
                        style: ThemeText.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
