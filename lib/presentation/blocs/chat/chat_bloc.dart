import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_app/data/repositories/yes_no_repository.dart';
import 'package:yes_no_app/domain/entities/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final yesNoRepository = YesNoRepositoryImpl(Dio());

  ChatBloc() : super(ChatInitial([])) {
    on<SendMessageEvent>((event, emit) async {
      final messages = List<Message>.from(state.messages);
      messages.add(event.message);
      emit(ChatInitial(messages));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ScrollToEnd(messages));
      if (event.message.text.endsWith('?')) {
        add(HerReplyEvent());
      }
    });
    on<HerReplyEvent>((event, emit) async {
      final messages = List<Message>.from(state.messages);
      final herMessage = await yesNoRepository.fetchMessage();
      messages.add(herMessage);
      emit(ChatInitial(messages));
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ScrollToEnd(messages));
    });
  }
}
