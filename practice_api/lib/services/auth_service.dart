import 'package:dio/dio.dart';
import 'package:practice_api/data/data.dart';
import 'package:practice_api/model/authenticate.dart';
import 'package:practice_api/model/phone.dart';

class AuthService {
  String baseUrl = "$BASE_URL/api/v1/authorization";

  Future<bool> authorization({required String phoneNumber}) async {
    try {
      final Response response = await Dio().post(
        baseUrl,
        data: {
          "auth:",
          phoneModel(phone: phoneNumber).toJson(),
        },
      );
      return response.data["status"] == 'ok';
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final Response response = await Dio().get(
        baseUrl,
        queryParameters: {
          "auth": authenticateModel(phone: phoneNumber, code: code).toJson(),
        },
      );
      return response.data["result"]["verify"] == "ok";
    } catch (e) {
      return false;
    }
  }
}
