import 'package:balenciaga_ecommerce/data/oboarding_data.dart';
import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/views/onboarding/components/boarding_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
int currentPage = 0;
final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  // maksud dari kode ini adlh untuk memberitahu setiap kali ada perubahan
                  // di satu objek atau halaman yang di trigger oleh adanya interaksi pengguna
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onBoardingData[index].text,
                  image: onBoardingData[index].image,
                ),
                ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingData.length,
                  (index) => _dotsIndicator(index: index)
                )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor
                  ),
                  onPressed: () {
                    if (currentPage == onBoardingData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease
                      );
                    }
                  },
                  child: Text(
                    // currentPage == 3 -1 ?
                    currentPage == onBoardingData.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
        ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor
      ),
      width: currentPage == index ? 20 : 7,
      height: 5,
      duration: animationDuration,
    );
  }
}