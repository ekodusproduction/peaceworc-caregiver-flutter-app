part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatListLoadingState extends ChatState{}
class ChatListSuccessState extends ChatState{
 final ChatResponse chatResponse;
   ChatListSuccessState(this.chatResponse);
}
class ChatListErrorState extends ChatState{
  final String message;
  ChatListErrorState(this.message);
}
