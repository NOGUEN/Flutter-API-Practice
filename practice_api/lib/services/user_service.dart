import 'package:dio/dio.dart';
import 'package:practice_api/data/data.dart';
import 'package:practice_api/model/user.dart';
import 'package:practice_api/model/user_response.dart';
import 'package:practice_api/utility/token_manager.dart';

class UserService with TokenManager {
  String baseUrl = "$baseApiUrl/api/v1/users";

  Future<UserModel?> getUser() async {
    try {
      final Response response = await Dio().get(
        baseUrl,
        options: Options(
          headers: {"Authorization": "Bearer ${getToken(accessTokenkey)}"},
        ),
      );
      final UserResponse responseValue = UserResponse.fromJson(response.data);
      final UserModel? user = responseValue.user;

      return user;
    } catch (e) {
      return null;
    }
  }
}
