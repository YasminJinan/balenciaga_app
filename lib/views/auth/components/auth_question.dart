import 'package:flutter/material.dart';

class AuthQuestion extends StatelessWidget {
  const AuthQuestion({super.key, required this.question, required this.actionText, required this.onPressed});
  final String question;
  final String actionText;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(onPressed: onPressed, child: Text(actionText)
        ),
      ],
    );
  }
}