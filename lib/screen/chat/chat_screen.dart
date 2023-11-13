import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peace_worc/api/api_links.dart';
import 'package:peace_worc/bloc/chat/chat_bloc.dart';
import 'package:peace_worc/hive/hive_init.dart';
import 'package:peace_worc/model/chat/chat_data_model.dart';
import 'chat_message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var uuid = Uuid();
  final _textController = TextEditingController();
  List<ChatMessage> chatMessages = [
    ChatMessage(message: "Hello, Will", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "How have you been?", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "ehhhh, doing OK.", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "Is there any thing wrong?", messageType: "sender", timestamp: "01:35 AM", status: "seen",),
  ];
  late IO.Socket socket;
  @override
  void initState() {
    initSocket();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ChatBloc>(context).add(FetchChatListEvent(job_id: 5, page: 1));
    });
    super.initState();
  }
  initSocket() {
    socket = IO.io(ApiLinks.NODE_URL,
        IO.OptionBuilder().setTransports(['websocket']).build());
    socket.connect();

    socket.onConnect((_) {
      print('connection established');
    });
  socket.emit("signin", getUserId());
    socket.on("receiveMessage", (messages) {
      print("receiveMessage${messages}");
      setState(() {
        chatMessages = [
          ...chatMessages,
          ChatMessage(
              message: messages['msg'],
              timestamp: messages['time'],
              status: "seen",
              messageType: "receiver",)
        ];
      });
    });

    socket.on("message", (message) {
      print(message);
    });
  }
  List<ChatMessage> messages = [
    ChatMessage(message: "Hello, Will", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "How have you been?", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "ehhhh, doing OK.", messageType: "receiver", timestamp: "01:35 AM", status: "seen",),
    ChatMessage(message: "Is there any thing wrong?", messageType: "sender", timestamp: "01:35 AM", status: "seen",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Kriss Benwat",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                     // Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                const Icon(Icons.info_outline,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: chatMessages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return ChatMessage(message: chatMessages[index].message, timestamp: chatMessages[index].timestamp, status: chatMessages[index].status, messageType: chatMessages[index].messageType);
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      String message = _textController.text;
                      String datetime = DateTime.now().toString();
                      print("message${message}");
                      socket.emit("sendMessage",
                         ChatDataModel(message: message, userId: getUserId(), agencyId: 8, currentTime: datetime, filePath: "", uuId: uuid.v1(), jobId: 5, accessToken: getToken()));
                      _textController.clear();
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          )
        ]
      ),
    );
  }
  String convertTimeStamp(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String convertedDateTime =
        "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}-${dateTime.minute.toString().padLeft(2, '0')}";
    return convertedDateTime;
  }
}
