import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home_screen/home_screen.dart';


class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding-2.png",
      "title": "Explore All Genres",
      "description":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    },
    {
      "image": "assets/images/onboarding-3.png",
      "title": "Create Watchlists",
      "description":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      "image": "assets/images/onboarding-4.png",
      "title": "Rate, Review, and Learn",
      "description":
          "Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/images/onboarding-5.png",
      "title": "Rate, Review, and Learn",
      "description":
          "Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/images/onboarding-6.png",
      "title": "Rate, Review, and Learn",
      "description":
          "Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
  ];

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  onboardingData[index]["image"]!,
                  fit: BoxFit.fill,
                ),
              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        onboardingData[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 20),



                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _currentIndex == onboardingData.length - 1
                                  ? () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  HomeScreen.routeName,
                                );
                              }
                                  : _nextPage,
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  backgroundColor: Color(0xFFF6BD00),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                              child: Text(
                                  _currentIndex == onboardingData.length - 1 ? "Finish" : "Next"),
                            ),
                          ),
                          if (_currentIndex > 0) SizedBox(height: 10),

                          if (_currentIndex > 0)
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: _previousPage,
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 20),

                                    foregroundColor:Color(0xFFF6BD00),
                                  side: BorderSide(color:Color(0xFFF6BD00)),
                                  shape:  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )
                                ),
                                child: Text("Back"),
                              ),
                            ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
