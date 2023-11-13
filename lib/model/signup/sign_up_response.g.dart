// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as String?,
      token: json['token'] as String?,
      httpStatusCode: json['http_status_code'] as int?,
    )..error = json['error'] as String?;

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
      'http_status_code': instance.httpStatusCode,
      'error': instance.error,
    };
