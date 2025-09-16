import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/views/auth/login_screen.dart';
import 'package:balenciaga_ecommerce/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(BalenciagaApp());
}

class BalenciagaApp extends StatefulWidget {
  const BalenciagaApp({super.key});


  @override
  State<BalenciagaApp> createState() => _BalenciagaAppState();
}

class _BalenciagaAppState extends State<BalenciagaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Balenciaga App",
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        visualDensity: VisualDensity.adaptivePlatformDensity, 
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall:  TextStyle(color: textColor),
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      // InintialRoute untuk mendefininiskna kelas 
      // apa yang akna tampil pertama kali saat aplikasi dijalankan
      initialRoute: '/onboarding',
      routes: {
        '/onboarding' : (context) =>OnboardingScreen(),
        '/login' : (context) =>LoginScreen()
      },
    );
  }
}