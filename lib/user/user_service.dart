import 'package:example_app/model/user_list_response.dart';
import 'package:example_app/network/Network.dart';

class UserService {
  Future<UserListResponse> getUsers(int page) async {
    final response = await NetworkProvider().get(
        "https://api.stackexchange.com/2.2/users",
        queryParameters: {"site": "stackoverflow", "page": page});
    return UserListResponse.fromJson(response.data);
  }
}
