class ChatDataModel{
  final String? message;
  final int? userId;
  final int? agencyId;
  final String? currentTime;
  final String? filePath;
  final String? uuId;
  final int? jobId;
  final String? accessToken;
  ChatDataModel({required this.message, required this.userId, required this.agencyId, required this.currentTime, required this.filePath
  , required this.uuId, required this.jobId, required this.accessToken
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.message;
    data['userId'] = this.userId;
    data['targetId'] = this.agencyId;
    data['time'] = this.currentTime;
    data['image'] = this.filePath;
    data['messageId'] = this.uuId;
    data['jobId'] = this.jobId;
    data['token'] = this.accessToken;
    return data;
  }
}

