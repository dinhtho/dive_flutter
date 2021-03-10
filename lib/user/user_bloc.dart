import 'dart:async';

import 'package:example_app/network/Network.dart';
import 'package:example_app/user/user_service.dart';

class UserBloc {
  final _userListStreamController = StreamController.broadcast();

  Stream get userListStream => _userListStreamController.stream;

  getUsers() {
    Network.request(
      call: UserService().getUsers(),
      onLoading: (loading) =>  _userListStreamController.sink.add(loading),
      onSuccess: (data) => _userListStreamController.sink.add(data),
      onError: (error) => _userListStreamController.sink.add(error),
    );
  }

  dispose() {
    _userListStreamController.close();
  }
}
