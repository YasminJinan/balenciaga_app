import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, 
  required this.title, required this.subtitle, this.image});
  final String title;
  final String subtitle;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null)
        Center(
          child: image!,
        ),
        SizedBox(height: 16,),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),
        ),
        SizedBox(height: 24,)
      ],
    );
  }
}