// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_accept_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermAcceptResponse _$TermAcceptResponseFromJson(Map<String, dynamic> json) =>
    TermAcceptResponse(
      refreshToken: json['refresh_token'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$TermAcceptResponseToJson(TermAcceptResponse instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'access_token': instance.accessToken,
    };
