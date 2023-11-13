// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certificate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertificateResponse _$AddCertificateResponseFromJson(
        Map<String, dynamic> json) =>
    AddCertificateResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] as String?,
      token: json['token'] as String?,
      httpStatusCode: json['http_status_code'] as int?,
    )..error = json['error'] as String?;

Map<String, dynamic> _$AddCertificateResponseToJson(
        AddCertificateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
      'http_status_code': instance.httpStatusCode,
      'error': instance.error,
    };
