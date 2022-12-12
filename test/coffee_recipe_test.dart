import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];

    var recipe =
        (CoffeeRecipe('test recipe', 5, 5, 'medium grind', 'details', steps));

    //check that it has the right data
    expect(recipe.name, 'test recipe');
    expect(recipe.coffeeVolumeGrams, 5);
    expect(recipe.waterVolumeGrams, 5);
    expect(recipe.grindSize, 'medium grind');
    expect(recipe.steps.length, 5);
  });

  //how do we test rejecting invalid coffee recipes?
  group("Invalid Inputs/Values", () {
  
    test('Throws ArgumentError when name is empty', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('', 5, 5, 'medium grind', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when coffee grams is less than 0', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('', -5, 5, 'medium grind', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when coffee grams is 0', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('', 0, 5, 'medium grind', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when water grams is less than 0', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('', 5, -5, 'medium grind', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when water grams is 0', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('', 5, 0, 'medium grind', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when grindSize is empty', () {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 30)
      ];

      expect(() => CoffeeRecipe('coffee', 5, 5, '', 'details', steps), throwsArgumentError);
    });

    test('Throws ArgumentError when steps list is empty', () {
      List<RecipeStep> steps = [
      ];

      expect(() => CoffeeRecipe('coffee', 5, 5, 'medium grind', 'details', steps), throwsArgumentError);
    });
  });
}
