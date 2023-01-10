import 'package:get_storage/get_storage.dart';

class TokenManager {
  Future<bool> saveToken(String tokenKey, String? token) async {
    final storage = GetStorage();
    await storage.write(tokenKey, token);
    return true;
  }

  String? getToken(String tokenKey) {
    final storage = GetStorage();
    return storage.read(tokenKey);
  }

  Future<void> removeToken(String tokenKey) async {
    final storage = GetStorage();
    await storage.remove(tokenKey);
  }
}
