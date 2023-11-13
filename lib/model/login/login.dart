class Login {

  bool? success;
  String? message;
  Data? data;
  String? token;
  int? httpStatusCode;
  String? error;

  Login(
      {this.success, this.message, this.data, this.token, this.httpStatusCode});
  Login.withError(String err):error = err;
  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']): null;
    token = json['token'];
    httpStatusCode = json['http_status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['data'] = this.data;
    data['token'] = this.token;
    data['http_status_code'] = this.httpStatusCode;
    return data;
  }
}
class Data{
  int? id;
  String? name;
  String? email;
  Data(
      {this.id, this.name, this.email});
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];

  }
}