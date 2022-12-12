class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    if(text == ''){
      throw ArgumentError();
    }
    if(time <= 0){
      throw ArgumentError();
    }

    this.text = text;
    this.time = time;
  }
}
