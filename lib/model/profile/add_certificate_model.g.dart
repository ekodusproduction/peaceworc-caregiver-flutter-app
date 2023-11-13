// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCertificateDataModel _$AddCertificateDataModelFromJson(
        Map<String, dynamic> json) =>
    AddCertificateDataModel(
      certificateOrCourse: json['certificate_or_course'] as String,
      document: json['document'] as String,
      startYear: json['start_year'] as String,
      endYear: json['end_year'] as String,
    );

Map<String, dynamic> _$AddCertificateDataModelToJson(
        AddCertificateDataModel instance) =>
    <String, dynamic>{
      'certificate_or_course': instance.certificateOrCourse,
      'document': instance.document,
      'start_year': instance.startYear,
      'end_year': instance.endYear,
    };
