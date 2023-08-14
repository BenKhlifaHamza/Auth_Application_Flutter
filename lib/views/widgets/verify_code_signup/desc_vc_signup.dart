import 'package:flutter/material.dart';

class DescVerifyCodeSignUp extends StatelessWidget {
  final String text;
  final String email;
  const DescVerifyCodeSignUp(
      {super.key, required this.text, required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text\n$email",
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
