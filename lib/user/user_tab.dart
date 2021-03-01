import 'package:example_app/model/user_list_response.dart';
import 'package:example_app/user/user_bloc.dart';
import 'package:example_app/user/user_item.dart';
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
  final userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    userBloc.getUsers();
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
                initialData: false,
                stream: userBloc.userListStream,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data is bool) {
                    return Center(
                        child: data ? CircularProgressIndicator() : Container());
                  } else if (data is UserListResponse) {
                    return ListView.builder(
                      itemCount: data.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UserItem(data.items[index]);
                      },
                    );
                  } else if (data is Exception) {
                    return Center(child: Text(data.toString()));
                  } else {
                    throw Exception("Not found");
                  }
                },
              ),
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
