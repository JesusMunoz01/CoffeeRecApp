import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import 'package:homebrew_dripper/utils/colors.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: HombrewColors.colors.blue,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 20, 60),
            child: Text("${stepTimeRemaining}",
                key: Key("startTime${currentStep}"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: HombrewColors.colors.white,
                    fontFamily: 'Kollektif',
                    fontSize: 96)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 00, 00, 60),
            child: Text(
              "${currentRecipeStep.text}",
              key: Key('recipeStep${currentStep}'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: HombrewColors.colors.white,
                  fontFamily: 'Kollektif',
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text("Steps",
                style: TextStyle(
                    color: HombrewColors.colors.white,
                    fontFamily: 'Kollektif',
                    fontSize: 14)),
          ),
          // ignore: sdk_version_ui_as_code
          for (RecipeStep step in remainingSteps)
            if (currentRecipeStep == step)
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: HombrewColors.colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                        title: Text(step.text,
                            style: TextStyle(
                                color: HombrewColors.colors.white,
                                fontFamily: 'Kollektif',
                                fontSize: 14))),
                  ))
            else
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListTile(
                    title: Text(
                      step.text,
                      style: TextStyle(
                        color: HombrewColors.colors.white,
                        fontFamily: 'Kollektif',
                        fontSize: 14,
                      ),
                    ),
                  ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
