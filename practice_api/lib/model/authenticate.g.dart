// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

authenticateModel _$authenticateModelFromJson(Map<String, dynamic> json) =>
    authenticateModel(
      phone: json['phone'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$authenticateModelToJson(authenticateModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
