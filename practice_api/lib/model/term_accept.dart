import 'package:json_annotation/json_annotation.dart';
part 'term_accept.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TermAcceptedModel {
  final DateTime termsAcceptedAt;

  TermAcceptedModel({
    required this.termsAcceptedAt,
  });

  factory TermAcceptedModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TermAcceptedModelFromJson(json);

  Map<String, dynamic> toJson() => _$TermAcceptedModelToJson(this);
}
