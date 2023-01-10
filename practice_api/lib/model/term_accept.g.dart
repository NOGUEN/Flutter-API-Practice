// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_accept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermAcceptedModel _$TermAcceptedModelFromJson(Map<String, dynamic> json) =>
    TermAcceptedModel(
      termsAcceptedAt: DateTime.parse(json['terms_accepted_at'] as String),
    );

Map<String, dynamic> _$TermAcceptedModelToJson(TermAcceptedModel instance) =>
    <String, dynamic>{
      'terms_accepted_at': instance.termsAcceptedAt.toIso8601String(),
    };
