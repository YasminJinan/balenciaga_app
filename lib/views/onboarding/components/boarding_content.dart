import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/utils/size_config.dart';
import 'package:flutter/widgets.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 30),
          Text(
            "Owala",
            style: TextStyle(
              color: primaryColor,
              fontSize: getProporsionateScreenHeight(36),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
