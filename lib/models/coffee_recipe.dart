import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {

    if(name == ''){
      throw ArgumentError();
    }
    if(coffeeVolumeGrams <= 0){
      throw ArgumentError();
    }
    if(waterVolumeGrams <= 0){
      throw ArgumentError();
    }
    if(grindSize == ''){
      throw ArgumentError();
    }
    if(steps.length <= 0){
      throw ArgumentError();
    }


    this.name = name;
    this.coffeeVolumeGrams = coffeeVolumeGrams;
    this.waterVolumeGrams = waterVolumeGrams;
    this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    this.steps = steps;
  }
}
