import 'package:example_app/Styles.dart';
import 'package:example_app/extension.dart';
import 'package:example_app/model/user_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  final Items data;

  UserItem(this.data);

  @override
  State<StatefulWidget> createState() {
    return _UserItemState();
  }
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    final user = widget.data;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 8, left: 5, bottom: 8, right: 5),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                backgroundImage: NetworkImage(user.profileImage.value()),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.displayName.value(),
                            style: ThemeText.bold.copyWith(fontSize: 16),
                          ),
                          Text(
                            user.lastAccessDate.toString(),
                            textAlign: TextAlign.end,
                            style: ThemeText.bold.copyWith(color: Colors.grey),
                          ),
                        ],
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
                              user.reputation.toString(),
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
                              user.location.value(),
                              style: ThemeText.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
