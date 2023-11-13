part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}
class FetchChatListEvent extends ChatEvent{
  final int job_id;
  final int page;
  FetchChatListEvent({required this.job_id, required this.page});
}

class FetchChatListSuccessEvent extends ChatEvent{}
class FetchChatListErrorEvent extends ChatEvent{}
