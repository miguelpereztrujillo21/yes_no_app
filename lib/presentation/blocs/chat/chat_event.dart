part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final Message message;

  SendMessageEvent({required this.message});
}
