import 'package:example_app/model/user_list_response.dart';
import 'package:example_app/network/Network.dart';

class UserService {
  Future<UserListResponse> getUsers() async {
    final response = await NetworkProvider()
        .get("https://api.stackexchange.com/2.2/users?site=stackoverflow");
    return UserListResponse.fromJson(response.data);
  }
}
