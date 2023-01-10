import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:practice_api/data/data.dart';
import 'package:practice_api/model/authenticate.dart';
import 'package:practice_api/model/phone.dart';
import 'package:practice_api/model/term_accept.dart';
import 'package:practice_api/model/term_accept_response.dart';
import 'package:practice_api/utility/token_manager.dart';

class AuthService with TokenManager {
  String baseUrl = "$baseApiUrl/api/v1/authorizations";

  Future<bool> authenticate({required String phoneNumber}) async {
    try {
      final Response response = await Dio().post(
        baseUrl,
        data: {
          "auth": PhoneModel(phone: phoneNumber).toJson(),
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
          "auth": AuthenticateModel(phone: phoneNumber, code: code).toJson(),
        },
      );
      return response.data["result"]["verify"] == "ok";
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkSignedUp({
    required String phoneNumber,
  }) async {
    try {
      final Response response =
          await Dio().post("$baseUrl/check_signed_up", data: {
        "auth": PhoneModel(phone: phoneNumber).toJson(),
      });

      String? signedTime = response.data["terms_accepted_at"];
      return signedTime != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String serialized = stringToBase64.encode("$phoneNumber:$code");

      final Response response = await Dio().post(
        "$baseUrl/sign_up",
        options: Options(
          headers: {
            "Authorization": "Basic $serialized",
          },
        ),
        data: {
          "auth": TermAcceptedModel(termsAcceptedAt: DateTime.now()).toJson(),
        },
      );
      final tokenData = TermAcceptResponse.fromJson(response.data["token"]);

      saveToken(refreshTokenKey, tokenData.refreshToken);
      saveToken(accessTokenkey, tokenData.accessToken);
      return true;
    } catch (e) {
      return false;
    }
  }
}
