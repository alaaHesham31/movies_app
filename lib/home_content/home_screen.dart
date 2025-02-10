import 'package:flutter/material.dart';
import 'package:movies_app/home_content/tabs/home_tab.dart';
import 'package:movies_app/home_content/tabs/search_tab.dart';
import 'package:movies_app/home_content/tabs/explore_tab.dart';
import 'package:movies_app/home_content/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.yellow,
          showUnselectedLabels: true,
          onTap: (value) {
            currentIndex = value;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 32), label: 'menu'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 32), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore, size: 32), label: 'explore'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 32,
                ),
                label: 'profile'),
          ]),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ExploreTab(),
    ProfileTab(),
  ];
}
