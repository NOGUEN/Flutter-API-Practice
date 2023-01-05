import 'package:practice_api/services/auth_service.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();

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
}
