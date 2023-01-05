// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateModel _$AuthenticateModelFromJson(Map<String, dynamic> json) =>
    AuthenticateModel(
      phone: json['phone'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$AuthenticateModelToJson(AuthenticateModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
