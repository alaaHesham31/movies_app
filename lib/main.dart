import 'package:flutter/material.dart';
import 'package:movies_app/home_content/home_screen.dart';
import 'package:movies_app/home_content/tabs/home_tab.dart';
import 'package:movies_app/screens/intro_screen.dart';
import 'package:movies_app/screens/onboarding_screen.dart';
import 'package:movies_app/theme/app_theme.dart';

import 'home_content/tabs/search_tab.dart';
import 'home_content/tabs/explore_tab.dart';
import 'home_content/tabs/profile_tab.dart';

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
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
