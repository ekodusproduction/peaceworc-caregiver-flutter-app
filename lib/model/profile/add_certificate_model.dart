
import 'package:json_annotation/json_annotation.dart';

part 'add_certificate_model.g.dart';

/// Generated class description...
@JsonSerializable()
class AddCertificateDataModel {
  @JsonKey(name: 'certificate_or_course')
  String certificateOrCourse;

  /// data
  String document;

  @JsonKey(name: 'start_year')
  String startYear;

  @JsonKey(name: 'end_year')
  String endYear;


  /// Constructor...
  AddCertificateDataModel({required this.certificateOrCourse, required this.document, required this.startYear, required this.endYear,  });

  /// Deserializer...
  factory AddCertificateDataModel.fromJson(Map<String, dynamic> json) => _$AddCertificateDataModelFromJson(json);

  /// Serializer...
  Map<String, dynamic> toJson() => _$AddCertificateDataModelToJson(this);
}