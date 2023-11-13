import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget {

  final String message;
  final String timestamp;
  final String status;
  final String messageType;
  const ChatMessage(
      {
        required this.message,
        required this.timestamp,
        required this.status,
        required this.messageType,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment: (messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20),topLeft: (messageType == "receiver"?Radius.circular(0): Radius.circular(20) ), topRight: (messageType == "sender"? Radius.circular(0): Radius.circular(20))),
                color: (messageType  == "receiver"?Colors.grey.shade200:Colors.black),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: (messageType == "receiver" ? CrossAxisAlignment.start: CrossAxisAlignment.end),
                children: [
                  Text(message, style: TextStyle(fontSize: 15, color: (messageType  == "receiver"?Colors.black:Colors.white)),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timestamp, style: TextStyle(fontSize: 12, color: (messageType  == "receiver"?Colors.black:Colors.white)),),
                      SizedBox(width: 2,),
                      Text(status, style: TextStyle(fontSize: 12, color: (messageType  == "receiver"?Colors.black:Colors.white)),)
                    ],
                  )
                ],
              ),
            )
          ] ,
        ),
      ),
    );
  }
}
