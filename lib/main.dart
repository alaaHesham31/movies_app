import 'package:flutter/material.dart';
import 'package:movies_app/home_content/home_screen.dart';
import 'package:movies_app/home_content/tabs/home_tab.dart';

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
        HomeScreen.routeName: (context) => HomeScreen(),
        // HomeTab.routeName: (context) => HomeTab(),
        // SearchTab.routeName: (context) => SearchTab(),
        // WatchedTab.routeName: (context) => WatchedTab(),
        // SuggestedTab.routeName: (context) => SuggestedTab(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
