import 'package:flutter/material.dart';

class DescSuccessSignUp extends StatelessWidget {
  final String text;
  const DescSuccessSignUp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
