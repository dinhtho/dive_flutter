import 'package:example_app/model/user_list_response.dart';
import 'package:example_app/user/user_bloc.dart';
import 'package:example_app/user/user_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;
import 'package:example_app/extension.dart';

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
  final userBloc = UserBloc();
  int _currentPage = 1;
  List<Items> _users = [];

  @override
  void initState() {
    super.initState();
    userBloc.errorStream.listen((event) {
      Fluttertoast.showToast(msg: event.toString());
    });
    userBloc.getUsers(_currentPage);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // Fluttertoast.showToast(msg: widget.title);
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
              child: StreamBuilder(
                stream: userBloc.userListStream,
                builder: (context, AsyncSnapshot<UserListResponse> snapshot) {
                  if (snapshot.hasData) {
                    _users.addAll(snapshot.data.items);
                    return ListView.builder(
                      itemCount: snapshot.data.hasMore
                          ? _users.length + 1
                          : _users.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == _users.length) {
                          _currentPage++;
                          userBloc.getUsers(_currentPage);
                          return _buildItemLoadMore();
                        }
                        return UserItem(_users[index]);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ));
  }

  _buildItemLoadMore() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userBloc.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
