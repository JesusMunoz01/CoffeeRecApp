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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 337,
            height: 280,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color(0xFF4C748D), width: 2)),
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
                  if (recipe.name != "Test Recipe")
                    const Divider(
                      thickness: 1,
                      color: Color(0xFF4C74BD),
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
                border: Border.all(color: Color(0xFF4C748D), width: 2)),
            child: Column(children: [
              for (ResourceInfo resource in resources)
                Container(
                    child: Column(children: [
                  ListTile(
                    title: Text(
                      resource.name,
                      key: Key("${resource.name}ResourceText"),
                      style: TextStyle(
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
                  if (resource.link != "Link D")
                    const Divider(
                      thickness: 1,
                      color: Color(0xFF4C74BD),
                    )
                ]))
            ]))
      ],
    );
  }
}
