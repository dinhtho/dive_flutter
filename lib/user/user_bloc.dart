import 'dart:async';

import 'package:example_app/model/user_list_response.dart';
import 'package:example_app/network/Network.dart';
import 'package:example_app/user/user_service.dart';

class UserBloc {
  StreamController<UserListResponse> _userListStreamController;
  Stream<UserListResponse> userListStream;
  StreamController<Exception> _errorController;
  Stream<Exception> errorStream;

  UserBloc() {
    _userListStreamController = StreamController();
    userListStream = _userListStreamController.stream.asBroadcastStream();
    _errorController = StreamController();
    errorStream = _errorController.stream.asBroadcastStream();
  }

  getUsers(int page) {
    Network.request(
      call: UserService().getUsers(page),
      onLoading: (loading) => {

      },
      onSuccess: (data) => _userListStreamController.sink.add(data),
      onError: (error) => _errorController.sink.add(error),
    );
  }

  dispose() {
    _userListStreamController.close();
    _errorController.close();
  }
}
