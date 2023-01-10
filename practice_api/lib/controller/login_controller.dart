import 'package:practice_api/services/auth_service.dart';
import 'package:practice_api/services/user_service.dart';
import 'package:practice_api/model/user.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  final UserService userService = UserService();
  Rxn<UserModel> currentUser = Rxn<UserModel>();

  Future<void> authentication({required String phoneNumber}) async {
    await authService.authenticate(phoneNumber: phoneNumber);
  }

  Future<bool> checkCode({
    required String phoneNumber,
    required String code,
  }) async {
    bool result =
        await authService.checkCode(phoneNumber: phoneNumber, code: code);

    return result;
  }

  Future<bool> checkSignedUp({
    required String phoneNumber,
  }) async {
    bool result = await authService.checkSignedUp(phoneNumber: phoneNumber);

    return result;
  }

  Future<bool> signUp({
    required String phoneNumber,
    required String code,
  }) async {
    bool result =
        await authService.signUp(phoneNumber: phoneNumber, code: code);

    if (result) {
      final user = await userService.getUser();
      currentUser.value = user;
    }
    return result;
  }
}
