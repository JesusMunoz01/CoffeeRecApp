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
    RecipeStep("Add remaining water (295g)", 05),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 05),
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

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g water", 30),
    RecipeStep("Stir", 15),
    RecipeStep("Bloom", 30),
    RecipeStep("Add remaining water 240g", 30),
    RecipeStep("Stir", 15),
    RecipeStep("Place lid", 30),
    RecipeStep(
        "Place clever on top of cup and begin the draw down (if necessary add more water)",
        90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Texas Coffee Recipe",
      24,
      340,
      "coarse grind (French Press)",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe maketestRecipe2() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 30),
    RecipeStep("Add remaining water (295g)", 05),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 05),
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
    makeTexasCoffeeSchoolRecipe(),
    maketestRecipe2(),
    makeHomegroundsRecipe()
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
