import 'package:flutter/material.dart';
import 'package:message/widgets/MessageInput.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = '/chat_Screen';

  const new({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('MessageMe', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // add here LogOut Function
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Container(), MessageInput()],
        ),
      ),
    );
  }
}
