import 'package:flutter/cupertino.dart';

class SizeConfig {
  // class mediaQuery adalah class yang berfungsi untuk membuat aplikasi responsif
  // dgn cara mengambil ukuran aktual pada layar platform
  static  MediaQueryData _mediaQueryData = MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
 );
//  variable untuk menampung default size dari aplikasi,
//  mendapat ukuran aktual dari platform tersebuat
 static double screenWidth = 0.0;
 static double screenHeight = 0.0;
 static double defaultSize = 0.0;

//  fungsi ini untuk pemanggilan awal ketika aplikasi dijalankan
// dan untuk mendapatkan ukuran dari layar platform
 void init(BuildContext context) {
  //  mendapat ukuran aktual dari platform
  // karna didalam variable _mediaQueryData manggil class media query (ngambil ukuran aktual)
  _mediaQueryData = MediaQuery.of(context);
  // untk ukuran width saja dan juga height
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
 }
}

double getProporsionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight; 
}

double getProporsionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth; 
}
 
 