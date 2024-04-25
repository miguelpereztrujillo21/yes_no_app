import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/blocs/chat/chat_bloc.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

void main() => runApp(const ChatScreen());

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.secondary,
        title: const Text('Mama'),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
                'https://pymstatic.com/5844/conversions/personas-emocionales-wide_webp.webp'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  _ChatView();
  final ScrollController chatScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: BlocListener<ChatBloc, ChatState>(
                listener: (context, state) {
                  if (state is ScrollToEnd) {
                    chatScrollController.animateTo(
                      chatScrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    return ListView.builder(
                      controller: chatScrollController,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        return (message.fromWho == FromWho.hers)
                            ? HerMessageBubble(
                                message: message,
                              )
                            : MyMessageBubble(
                                message: message,
                              );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            MessageFieldBox(
              onValue: (value) {
                context.read<ChatBloc>().add(SendMessageEvent(
                    message: Message(text: value, fromWho: FromWho.mine)));
              },
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
