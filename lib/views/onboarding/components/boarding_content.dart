import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class onboardingContent extends StatelessWidget {
  const onboardingContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          '/assets/balenciagalogo.jpg',
          fit: BoxFit.cover,
        ),
        Spacer(),
        Text(
          "Owala",
          style: TextStyle(
            color: primaryColor,
            fontSize: getProporsionateScreenWidth(36),
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 15,),
        Text(
          text,
          textAlign: TextAlign.center,
           style: TextStyle(
            color: Colors.amber
          ),
          
        )
      ],
    );
  }
}