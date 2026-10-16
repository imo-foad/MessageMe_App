import 'package:flutter/material.dart';
import 'package:message/screens/chat_Screen.dart';
import 'package:message/screens/registration_screen.dart';
import 'package:message/screens/signIn_screen.dart';
import 'package:message/screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessageMe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChatScreen(),
    );
  }
}

