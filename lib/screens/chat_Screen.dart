import 'package:flutter/material.dart';
import 'package:message/widgets/MessageInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute = '/chat_Screen';

  const new({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        iconTheme: const IconThemeData(color: Colors.white),
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
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;
                List<Text> messagesWidgets = [];

                for (var message in messages) {
                  final messageText = message.get('text');
                  final messageSender = message.get('sender');

                  final messageWidget = Text('$messageText - $messageSender');
                  messagesWidgets.add(messageWidget);
                }
                return Column(children: messagesWidgets);
              },
            ),

            MessageInput(),
          ],
        ),
      ),
    );
  }
}
