import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/views/auth/login_screen.dart';
import 'package:balenciaga_ecommerce/views/auth/register_screen.dart';
import 'package:balenciaga_ecommerce/views/home/catalogue_screen.dart';
import 'package:balenciaga_ecommerce/views/home/ui/chat.dart';
import 'package:balenciaga_ecommerce/views/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'firebase_options.dart';



 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BalenciagaApp());
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
      home: OnboardingScreen(),
      routes: {
        '/onboarding' : (context) =>OnboardingScreen(),
        '/login' : (context) =>LoginScreen(),
        '/register' : (context) =>RegisterScreen(),
        '/catalogue' : (context) => CatalogueScreen(),
        '/chat' : (context) => ChatPage(),
      },
    );
  }
}