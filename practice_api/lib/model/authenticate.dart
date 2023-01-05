import 'package:json_annotation/json_annotation.dart';
part 'authenticate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthenticateModel {
  final String phone;
  final String code;

  AuthenticateModel({
    required this.phone,
    required this.code,
  });

  factory AuthenticateModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticateModelToJson(this);
}
