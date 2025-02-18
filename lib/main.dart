import 'package:flutter/material.dart';

import 'package:movies_app/ui/home_screen/home_screen.dart';
import 'package:movies_app/ui/intro_screen.dart';
import 'package:movies_app/ui/onboarding_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),

        HomeScreen.routeName: (context) => HomeScreen(),

      },
      initialRoute: IntroScreen.routeName,
    );
  }
}
