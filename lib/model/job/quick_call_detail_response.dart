class QuickCallDetailResponse {
  bool? success;
  String? message;
  List<Data>? data;
  String? token;
  int? httpStatusCode;
  String? error;

  QuickCallDetailResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});
  QuickCallDetailResponse.withError(String err):error = err;
  QuickCallDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }


}

class Data {
  int? jobId;
  String? companyName;
  String? companyPhoto;
  String? jobTitle;
  String? careType;
  List<CareItems>? careItems;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? amount;
  String? address;
  String? shortAddress;
  String? lat;
  String? long;
  double? distance;
  String? description;
  List<String>? medicalHistory;
  List<String>? expertise;
  List<String>? otherRequirements;
  List<String>? checkList;
  String? status;
  String? createdAt;

  Data(
      {this.jobId,
        this.companyName,
        this.companyPhoto,
        this.jobTitle,
        this.careType,
        this.careItems,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.amount,
        this.address,
        this.shortAddress,
        this.lat,
        this.long,
        this.distance,
        this.description,
        this.medicalHistory,
        this.expertise,
        this.otherRequirements,
        this.checkList,
        this.status,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    companyName = json['company_name'];
    companyPhoto = json['company_photo'];
    jobTitle = json['job_title'];
    careType = json['care_type'];
    if (json['care_items'] != null) {
      careItems = <CareItems>[];
      json['care_items'].forEach((v) {
        careItems!.add(new CareItems.fromJson(v));
      });
    }
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    amount = json['amount'];
    address = json['address'];
    shortAddress = json['short_address'];
    lat = json['lat'];
    long = json['long'];
    distance = json['distance'];
    description = json['description'];
    if (json['medical_history'] != null) {
      medicalHistory = <String>[];
      json['medical_history'].forEach((v) {
        medicalHistory!.add(v);
      });
    }
    if (json['expertise'] != null) {
      expertise = <String>[];
      json['expertise'].forEach((v) {
        expertise!.add((v));
      });
    }
    if (json['other_requirements'] != null) {
      otherRequirements = <String>[];
      json['other_requirements'].forEach((v) {
        otherRequirements!.add((v));
      });
    }
    if (json['check_list'] != null) {
      checkList = <String>[];
      json['check_list'].forEach((v) {
        checkList!.add((v));
      });
    }
    status = json['status'];
    createdAt = json['created_at'];
  }


}

class CareItems {
  String? age;
  String? gender;
  String? patientName;

  CareItems({this.age, this.gender, this.patientName});

  CareItems.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    gender = json['gender'];
    patientName = json['patient_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['patient_name'] = this.patientName;
    return data;
  }
}
