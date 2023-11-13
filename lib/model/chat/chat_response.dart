class ChatResponse {
  bool? success;
  String? message;
  List<ChatModel>? chatModel;
  String? token;
  int? httpStatusCode;
  String? error;
  ChatResponse(
      {this.success,
        this.message,
        this.chatModel,
        this.token,
        this.httpStatusCode});
  ChatResponse.withError(String err):error = err;
  ChatResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['chatModel'] != null) {
      chatModel = <ChatModel>[];
      json['chatModel'].forEach((v) {
        chatModel!.add(new ChatModel.fromJson(v));
      });
    }
    token = json['token'];
    httpStatusCode = json['httpStatusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.chatModel != null) {
      data['chatModel'] = this.chatModel!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['httpStatusCode'] = this.httpStatusCode;
    return data;
  }
}

class ChatModel {
  String? messageId;
  String? msg;
  String? image;
  int? isMessageSeen;
  int? userId;
  int? targetId;

  ChatModel(
      {this.messageId,
        this.msg,
        this.image,
        this.isMessageSeen,
        this.userId,
        this.targetId});

  ChatModel.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    msg = json['msg'];
    image = json['image'];
    isMessageSeen = json['is_message_seen'];
    userId = json['userId'];
    targetId = json['targetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['msg'] = this.msg;
    data['image'] = this.image;
    data['is_message_seen'] = this.isMessageSeen;
    data['userId'] = this.userId;
    data['targetId'] = this.targetId;
    return data;
  }
}
