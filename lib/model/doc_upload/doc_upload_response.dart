class GetDocumentResponse {
  bool? success;
  String? message;
  Data? data;
  String? token;
  int? httpStatusCode;
  String? error;

  GetDocumentResponse(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});
  GetDocumentResponse.withError(String err): error = err;
  GetDocumentResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? email;
  dynamic? phone;
  String? emailVerifiedAt;
  String? role;
  String? otp;
  String? otpValidity;
  int? isOtpVerified;
  int? isAgreedToTerms;
  String? lat;
  String? long;
  String? createdAt;
  String? updatedAt;
  int? status;
  dynamic? deletedAt;
  CaregiverProfileStatus? caregiverProfileStatus;
  List<Covid>? covid;
  List<ChildAbuse>? childAbuse;
  List<Criminal>? criminal;
  List<Driving>? driving;
  List<Employment>? employment;
  List<Identification>? identification;
  List<Tuberculosis>? tuberculosis;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.role,
        this.otp,
        this.otpValidity,
        this.isOtpVerified,
        this.isAgreedToTerms,
        this.lat,
        this.long,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.deletedAt,
        this.caregiverProfileStatus,
        this.covid,
        this.childAbuse,
        this.criminal,
        this.driving,
        this.employment,
        this.identification,
        this.tuberculosis});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    otp = json['otp'];
    otpValidity = json['otp_validity'];
    isOtpVerified = json['is_otp_verified'];
    isAgreedToTerms = json['is_agreed_to_terms'];
    lat = json['lat'];
    long = json['long'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    caregiverProfileStatus = json['caregiver_profile_status'] != null
        ? new CaregiverProfileStatus.fromJson(json['caregiver_profile_status'])
        : null;
    if (json['covid'] != null) {
      covid = <Covid>[];
      json['covid'].forEach((v) {
        covid!.add(new Covid.fromJson(v));
      });
    }
    if (json['child_abuse'] != null) {
      childAbuse = <ChildAbuse>[];
      json['child_abuse'].forEach((v) {
        childAbuse!.add(new ChildAbuse.fromJson(v));
      });
    }
    if (json['criminal'] != null) {
      criminal = <Criminal>[];
      json['criminal'].forEach((v) {
        criminal!.add(new Criminal.fromJson(v));
      });
    }
    if (json['driving'] != null) {
      driving = <Driving>[];
      json['driving'].forEach((v) {
        driving!.add(new Driving.fromJson(v));
      });
    }
    if (json['employment'] != null) {
      employment = <Employment>[];
      json['employment'].forEach((v) {
        employment!.add(new Employment.fromJson(v));
      });
    }
    if (json['identification'] != null) {
      identification = <Identification>[];
      json['identification'].forEach((v) {
        identification!.add(new Identification.fromJson(v));
      });
    }
    if (json['tuberculosis'] != null) {
      tuberculosis = <Tuberculosis>[];
      json['tuberculosis'].forEach((v) {
        tuberculosis!.add(new Tuberculosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['otp'] = this.otp;
    data['otp_validity'] = this.otpValidity;
    data['is_otp_verified'] = this.isOtpVerified;
    data['is_agreed_to_terms'] = this.isAgreedToTerms;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    if (this.caregiverProfileStatus != null) {
      data['caregiver_profile_status'] = this.caregiverProfileStatus!.toJson();
    }
    if (this.covid != null) {
      data['covid'] = this.covid!.map((v) => v.toJson()).toList();
    }
    if (this.childAbuse != null) {
      data['child_abuse'] = this.childAbuse!.map((v) => v.toJson()).toList();
    }
    if (this.criminal != null) {
      data['criminal'] = this.criminal!.map((v) => v.toJson()).toList();
    }
    if (this.driving != null) {
      data['driving'] = this.driving!.map((v) => v.toJson()).toList();
    }
    if (this.employment != null) {
      data['employment'] = this.employment!.map((v) => v.toJson()).toList();
    }
    if (this.identification != null) {
      data['identification'] =
          this.identification!.map((v) => v.toJson()).toList();
    }
    if (this.tuberculosis != null) {
      data['tuberculosis'] = this.tuberculosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaregiverProfileStatus {
  int? userId;
  int? isBasicInfoAdded;
  int? isOptionalInfoAdded;
  int? isDocumentsUploaded;
  int? isProfileApproved;

  CaregiverProfileStatus(
      {this.userId,
        this.isBasicInfoAdded,
        this.isOptionalInfoAdded,
        this.isDocumentsUploaded,
        this.isProfileApproved});

  CaregiverProfileStatus.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    isBasicInfoAdded = json['is_basic_info_added'];
    isOptionalInfoAdded = json['is_optional_info_added'];
    isDocumentsUploaded = json['is_documents_uploaded'];
    isProfileApproved = json['is_profile_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['is_basic_info_added'] = this.isBasicInfoAdded;
    data['is_optional_info_added'] = this.isOptionalInfoAdded;
    data['is_documents_uploaded'] = this.isDocumentsUploaded;
    data['is_profile_approved'] = this.isProfileApproved;
    return data;
  }
}

class Covid {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Covid(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Covid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ChildAbuse {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  ChildAbuse(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  ChildAbuse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Criminal {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Criminal(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Criminal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Driving {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Driving(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Driving.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Employment {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Employment(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Employment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Identification {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Identification(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Identification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Tuberculosis {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? image;
  String? expiryDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  Tuberculosis(
      {this.id,
        this.userId,
        this.name,
        this.type,
        this.image,
        this.expiryDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  Tuberculosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    expiryDate = json['expiry_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    data['expiry_date'] = this.expiryDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}