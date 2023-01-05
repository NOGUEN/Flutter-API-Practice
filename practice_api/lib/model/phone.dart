import 'package:json_annotation/json_annotation.dart';
part 'phone.g.dart';

@JsonSerializable()
class PhoneModel {
  final String phone;

  PhoneModel({
    required this.phone,
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneModelToJson(this);
}
