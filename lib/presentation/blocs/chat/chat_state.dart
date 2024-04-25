part of 'chat_bloc.dart';

@immutable
sealed class ChatState {
  final List<Message> messages;

  const ChatState({required this.messages});
}

class ChatInitial extends ChatState {
  ChatInitial(List<Message> messages) : super(messages: messages);
}

class ScrollToEnd extends ChatState {
  const ScrollToEnd(List<Message> messages) : super(messages: messages);
}
