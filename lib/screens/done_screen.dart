import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/utils/colors.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 400, 20, 0),
            child: Text(
              "Enjoy your amazing handmade coffee",
              style: TextStyle(
                  color: HombrewColors.colors.blue,
                  fontSize: 18,
                  fontFamily: 'Montserrat'),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 300, 20, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeSelectionScreen(),
                      ));
                },
                child: Text(
                  'done',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: HombrewColors.colors.blue,
                      fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
              ))
        ],
      ),
    );
  }
}
