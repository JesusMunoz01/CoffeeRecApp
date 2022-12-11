import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HombrewColors.colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEBREW",
                style: TextStyle(
                    fontFamily: 'norwester',
                    fontSize: 48,
                    color: HombrewColors.colors.white)),
            Text("Great Coffee at Home",
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 18,
                    color: HombrewColors.colors.white))
          ],
        ),
      ),
    );
  }
}
