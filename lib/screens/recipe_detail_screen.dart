// ignore_for_file: sdk_version_ui_as_code

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  int totTime(recipe) {
    int totalTime = 0;
    for (RecipeStep s in recipe.steps) {
      totalTime += s.time;
    }
    return totalTime;
  }

  String retTime(time){
    if(time % 60 < 10){
      return "0${(time % 60).floor().toString()}";
    }
    else{
      return "${(time % 60).floor().toString()}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        key: Key("bbackButton"),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF4C748B),
            ),
            key: Key('goBack'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff4c748b), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        '${recipe.name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontFamily: 'Kollektif',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        key: Key('recipe-name'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Divider(
                        color: Color(0xff4c748b),
                        thickness: 1,
                      ),
                    ),
                    Text(
                      '${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}',
                      style: TextStyle(
                          color: Color(0xff4c748b),
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      key: Key('coffee-grams-text'),
                    ),
                    Text(
                      '${recipe.waterVolumeGrams}g - water',
                      style: TextStyle(
                          color: Color(0xff4c748b),
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      key: Key('water-grams-text'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        "${recipe.miscDetails}",
                        style: TextStyle(
                            color: Color(0xff4c748b),
                            fontFamily: 'Montserrat',
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
            child: Row(
              children: [
                for (RecipeStep s in recipe.steps) ...[],
                Expanded(
                  child: Text(
                    'Steps',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff4c748b),
                        fontFamily: 'Kollektif',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    key: Key('steps-title'),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Total: ${(totTime(recipe) / 60).floor().toString()}:${retTime(totTime(recipe))}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color(0xff4c748b),
                        fontFamily: 'Kollektif',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    key: Key('total-time'),
                  ),
                ),
              ],
            ),
          ),
          StepsList(recipe),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 150, 40, 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeStepsScreen(recipe)),
                );
              },
              child: Text('Start'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Color(0xff4c748b)),
              key: Key('start-btn'),
            ),
          ),
        ],
      ),
    );
  }
}

class StepsList extends StatelessWidget {
  CoffeeRecipe recipe;
  StepsList(this.recipe);

  String retTime(time){
    if(time % 60 < 10){
      return "0${(time % 60).floor().toString()}";
    }
    else{
      return "${(time % 60).floor().toString()}";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (RecipeStep s in recipe.steps)
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff4c748b), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              child: ListTile(
                // shape: RoundedRectangleBorder(
                //     side: BorderSide(width: 2, color: Color(0xff4c748b), ),
                //     borderRadius: BorderRadius.circular(10)),
                visualDensity: VisualDensity(vertical: -2),
                dense: true,
                title: Text(
                  s.text,
                  style: TextStyle(
                      color: Color(0xff4c748b),
                      fontFamily: 'Kollektif',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  key: Key('steps-text'),
                ),
                trailing: Text(
                  "0${(s.time / 60).floor().toString()}:${retTime(s.time)}",
                  style: TextStyle(
                      color: Color(0xff4c748b),
                      fontFamily: 'Kollektif',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  key: Key('steps-time'),
                ),
              ),
            ),
          )
      ],
    );
  }
}
