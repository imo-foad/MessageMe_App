import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {

  late User? signInUser = FirebaseAuth.instance.currentUser;
  String? messageText;
  final _firebase = FirebaseFirestore.instance;
  final _firestore = FirebaseFirestore.instance;

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final message = _controller.text.trim();

    if (message.isEmpty) return;

    debugPrint('Message: $message');

    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
    void messagesStreams() async {
    await for (var snapshot in _firestore.collection('Messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orange[900],
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextField(
                onChanged: (value) {
                  //
                  messageText = value;
                },
                controller: _controller,
                minLines: 1,
                maxLines: 5,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: const InputDecoration(
                  hintText: ' Send Message...',

                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              onPressed: () {
                _sendMessage();
                _firebase.collection('Messages').add({
                  'text': messageText,
                  'sender': signInUser?.email,
                });
                messagesStreams();
              },

              style: IconButton.styleFrom(
                backgroundColor: Colors.orange[900],
                foregroundColor: Colors.white,
              ),
              icon: Icon(Icons.send_rounded, size: 23.0),
            ),
          ),
        ],
      ),
    );
  }
}
