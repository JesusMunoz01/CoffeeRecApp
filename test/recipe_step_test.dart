import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    var step = 
      RecipeStep("step1", 30);

    //check that it has the right data
    expect(step.text, 'step1');
    expect(step.time, 30);
  });

  //how do we test rejecting invalid recipe steps?
  group("Invalid Inputs/Values", () {
    test('Throws ArgumentError when text is empty', () {
      expect(() => RecipeStep("", 30), throwsArgumentError);
    });

    test('Throws ArgumentError when time is 0', () {
      expect(() => RecipeStep("step1", 0), throwsArgumentError);
    });

    test('Throws ArgumentError when time is less than 0', () {
      expect(() => RecipeStep("step1", -5), throwsArgumentError);
    });

  });
}
