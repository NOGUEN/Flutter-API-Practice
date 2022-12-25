import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String? username;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.username,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
