import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:peace_worc/model/chat/chat_response.dart';
import 'package:peace_worc/repository/chat/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo chatRepo = ChatRepo();
  ChatBloc() : super(ChatInitial()) {
    on<FetchChatListEvent>(fetchChatListEvent);
  }

  Future<FutureOr<void>> fetchChatListEvent(FetchChatListEvent event, Emitter<ChatState> emit) async {
    try{
      emit(ChatListLoadingState());
      final chatListResponse = await chatRepo.fetchChats( event.job_id,  event.page);
      print("responsessss"+ chatListResponse.httpStatusCode.toString());
      if(chatListResponse.httpStatusCode == 200){


        emit(ChatListSuccessState(chatListResponse));
      }
      if(chatListResponse.httpStatusCode == 400 || chatListResponse.httpStatusCode == 401){
        emit(ChatListErrorState(chatListResponse.message!));
      }


    } catch(e){
      print("expection"+e.toString());
    }
  }
}
