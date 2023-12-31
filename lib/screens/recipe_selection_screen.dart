// ignore_for_file: sdk_version_ui_as_code

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/resource_info.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/screens/resource_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/utils/resources_data.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: ListView(
        children: [
          Column(children: [
            Text(
              "Coffee Recipes",
              key: Key("coffee-recipes"),
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4C748B)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
            RecipeList(),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            Text(
              "Resources",
              key: Key("resources"),
              style: TextStyle(
                  fontFamily: 'Kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4C748B)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
            ResourceList()
          ])
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 337,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xFF4C748B), width: 2)),
            child: Column(children: [
              for (CoffeeRecipe recipe in recipes)
                Container(
                    child: Column(children: [
                  ListTile(
                    title: Text(
                      recipe.name,
                      key: Key("${recipe.name}Text"),
                      style: TextStyle(
                          color: Color(0XFF4C748B),
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    key: Key("${recipe.name}Button"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(recipe)),
                      );
                    },
                  ),
                  if (recipe.name != "Homegrounds Recipe")
                    const Divider(
                      thickness: 1,
                      color: Color(0xFF4C748B),
                    )
                ]))
            ]))
      ],
    );
  }
}

class ResourceList extends StatelessWidget {
  List<ResourceInfo> resources = ResourceData.loadResource();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 337,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xFF4C748B), width: 2)),
            child: Column(children: [
              for (ResourceInfo resource in resources)
                Container(
                    child: Column(children: [
                  ListTile(
                    title: Text(
                      resource.name,
                      key: Key("${resource.name}ResourceText"),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0XFF4C748B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    key: Key("${resource.name}ResourceButton"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResourceDetailScreen(resource)),
                      );
                    },
                  ),
                  if (resource.name != "Homebrew Dripper")
                    const Divider(
                      thickness: 1,
                      color: Color(0xFF4C748B),
                    )
                ]))
            ]))
      ],
    );
  }
}
