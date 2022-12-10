import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

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
          Text(recipe.name),
          Text("${recipe.coffeeVolumeGrams}"),
          Text("${recipe.waterVolumeGrams}"),
          ElevatedButton(
            child: Text("Start"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeStepsScreen(recipe)),
              );
            },
          )
        ],
      ),
    );
  }
}
