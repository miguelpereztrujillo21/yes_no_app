import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_app/domain/entities/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial([])) {
    on<SendMessageEvent>((event, emit) {
      final messages = List<Message>.from(state.messages);
      messages.add(event.message);
      emit(ChatInitial(messages));
    });
  }
}
