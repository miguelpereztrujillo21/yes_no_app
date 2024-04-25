import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_app/core/app_theme.dart';
import 'package:yes_no_app/presentation/blocs/chat/chat_bloc.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: MaterialApp(
          title: 'Yes No App',
          theme: AppTheme(selectedColor: 0).theme(),
          debugShowCheckedModeBanner: false,
          home: const ChatScreen()),
    );
  }
}
