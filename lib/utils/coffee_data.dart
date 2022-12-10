import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 30),
    RecipeStep("Add remaining water (295g)", 5),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 5),
    RecipeStep("Place on mug and wait", 75),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Homegrounds Recipe",
      23,
      345,
      "medium-coarse grind",
      "The original recipe: makes two delicious cups",
      steps);
  return recipe;
}

CoffeeRecipe maketestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 30),
    RecipeStep("Add remaining water (295g)", 5),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 5),
    RecipeStep("Place on mug and wait", 75),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test_Recipe",
      23,
      345,
      "medium-coarse grind",
      "The original recipe: makes two delicious cups",
      steps);
  return recipe;
}

CoffeeRecipe maketestRecipe2() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 30),
    RecipeStep("Add remaining water (295g)", 5),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 5),
    RecipeStep("Place on mug and wait", 75),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      23,
      345,
      "medium-coarse grind",
      "The original recipe: makes two delicious cups",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makeHomegroundsRecipe(),
    maketestRecipe(),
    maketestRecipe2()
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
