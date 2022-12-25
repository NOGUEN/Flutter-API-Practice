import 'package:json_annotation/json_annotation.dart';
part 'phone.g.dart';

@JsonSerializable()
class phoneModel {
  final String phone;

  phoneModel({
    required this.phone,
  });

  factory phoneModel.fromJson(Map<String, dynamic> json) =>
      _$phoneModelFromJson(json);
  Map<String, dynamic> toJson() => _$phoneModelToJson(this);
}
