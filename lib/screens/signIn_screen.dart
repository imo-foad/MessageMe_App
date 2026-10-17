import 'package:flutter/material.dart';
import 'package:message/widgets/my_button.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = '/signIn_screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 50.0),
            RegisterField(hintText: 'Enter your email'),
            SizedBox(height: 12.0),
            RegisterField(hintText: 'Enter your password'),
            SizedBox(height: 20.0),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'Sign In',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterField extends StatelessWidget {
  const RegisterField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.25),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
