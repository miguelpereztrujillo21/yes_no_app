import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/data/repositories/yes_no_repository.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = YesNoRepositoryImpl(Dio());
  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    if (text.endsWith('?')) {
      herReply();
    }
    messages.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.fetchMessage();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
