import 'package:json_annotation/json_annotation.dart';

part "term_accept_response.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class TermAcceptResponse {
  final String refreshToken;
  final String accessToken;

  TermAcceptResponse({
    required this.refreshToken,
    required this.accessToken,
  });

  factory TermAcceptResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TermAcceptResponseFromJson(json);
}
