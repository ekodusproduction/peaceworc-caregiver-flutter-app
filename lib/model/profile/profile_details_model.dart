class ProfileDetailsResponse {
  bool? success;
  String? message;
  Data? data;
  String? token;
  int? httpStatusCode;
  String? error;
  ProfileDetailsResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});
  ProfileDetailsResponse.withError(String err):error = err;
  ProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['http_status_code'] = this.httpStatusCode;
    return data;
  }
}

class Data {
  ProfileCompletionStatus? profileCompletionStatus;
  BasicInfo? basicInfo;
  int? rewards;
  int? strikes;
  int? flags;
  List<Education>? education;
  List<Certificate>? certificate;

  Data(
      {this.profileCompletionStatus,
        this.basicInfo,
        this.rewards,
        this.strikes,
        this.flags,
        this.education,
        this.certificate});

  Data.fromJson(Map<String, dynamic> json) {
    profileCompletionStatus = json['profile_completion_status'] != null
        ? new ProfileCompletionStatus.fromJson(
        json['profile_completion_status'])
        : null;
    basicInfo = json['basic_info'] != null
        ? new BasicInfo.fromJson(json['basic_info'])
        : null;
    rewards = json['rewards'];
    strikes = json['strikes'];
    flags = json['flags'];
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(new Education.fromJson(v));
      });
    }
    if (json['certificate'] != null) {
      certificate = <Certificate>[];
      json['certificate'].forEach((v) {
        certificate!.add(new Certificate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileCompletionStatus != null) {
      data['profile_completion_status'] =
          this.profileCompletionStatus!.toJson();
    }
    if (this.basicInfo != null) {
      data['basic_info'] = this.basicInfo!.toJson();
    }
    data['rewards'] = this.rewards;
    data['strikes'] = this.strikes;
    data['flags'] = this.flags;
    if (this.education != null) {
      data['education'] = this.education!.map((v) => v.toJson()).toList();
    }
    if (this.certificate != null) {
      data['certificate'] = this.certificate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileCompletionStatus {
  int? isBasicInfoAdded;
  int? isOptionalInfoAdded;
  int? isDocumentsUploaded;
  int? isProfileApproved;

  ProfileCompletionStatus(
      {this.isBasicInfoAdded,
        this.isOptionalInfoAdded,
        this.isDocumentsUploaded,
        this.isProfileApproved});

  ProfileCompletionStatus.fromJson(Map<String, dynamic> json) {
    isBasicInfoAdded = json['is_basic_info_added'];
    isOptionalInfoAdded = json['is_optional_info_added'];
    isDocumentsUploaded = json['is_documents_uploaded'];
    isProfileApproved = json['is_profile_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_basic_info_added'] = this.isBasicInfoAdded;
    data['is_optional_info_added'] = this.isOptionalInfoAdded;
    data['is_documents_uploaded'] = this.isDocumentsUploaded;
    data['is_profile_approved'] = this.isProfileApproved;
    return data;
  }
}

class BasicInfo {
  int? userId;
  String? photo;
  String? bio;
  String? phone;
  String? dob;
  String? gender;
  int? experience;
  int? careCompleted;
  User? user;

  BasicInfo(
      {this.userId,
        this.photo,
        this.bio,
        this.phone,
        this.dob,
        this.gender,
        this.experience,
        this.careCompleted,
        this.user});

  BasicInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    photo = json['photo'];
    bio = json['bio'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    experience = json['experience'];
    careCompleted = json['care_completed'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['photo'] = this.photo;
    data['bio'] = this.bio;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['experience'] = this.experience;
    data['care_completed'] = this.careCompleted;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  late final String email;

  User({this.id, required this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    return data;
  }
}

class Education {
  int? id;
  int? userId;
  String? schoolOrUniversity;
  String? degree;
  String? startYear;
  String? endYear;
  String? createdAt;
  String? updatedAt;

  Education(
      {this.id,
        this.userId,
        this.schoolOrUniversity,
        this.degree,
        this.startYear,
        this.endYear,
        this.createdAt,
        this.updatedAt});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    schoolOrUniversity = json['school_or_university'];
    degree = json['degree'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['school_or_university'] = this.schoolOrUniversity;
    data['degree'] = this.degree;
    data['start_year'] = this.startYear;
    data['end_year'] = this.endYear;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Certificate {
  int? id;
  int? userId;
  String? certificateOrCourse;
  String? startYear;
  String? endYear;
  String? document;
  String? createdAt;
  String? updatedAt;

  Certificate(
      {this.id,
        this.userId,
        this.certificateOrCourse,
        this.startYear,
        this.endYear,
        this.document,
        this.createdAt,
        this.updatedAt});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    certificateOrCourse = json['certificate_or_course'];
    startYear = json['start_year'];
    endYear = json['end_year'];
    document = json['document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['certificate_or_course'] = this.certificateOrCourse;
    data['start_year'] = this.startYear;
    data['end_year'] = this.endYear;
    data['document'] = this.document;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
