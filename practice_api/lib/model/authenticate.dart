import 'package:json_annotation/json_annotation.dart';
part 'authenticate.g.dart';

@JsonSerializable()
class authenticateModel {
  final String phone;
  final String code;

  authenticateModel({
    required this.phone,
    required this.code,
  });

  factory authenticateModel.fromJson(Map<String, dynamic> json) =>
      _$authenticateModelFromJson(json);
  Map<String, dynamic> toJson() => _$authenticateModelToJson(this);
}
