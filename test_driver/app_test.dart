// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });
    /*
    Given I am on the RecipeSelectionScreen
    When I tap "Sweet Maria's"
    Then I should see "Test Recipe"
    And I should see "22g - finely ground coffee"
    And I should see "360g - water"
    And I should see "Time: 3:45"
    */
    test('Should go to RecipeDetailScreen when Sweet Marias is pressed',
        () async {
      final sweetMariaBtn = find.byValueKey("Sweet Maria'sButton");
      final detailSweetMaria = find.byValueKey('recipe-name');
      final coffeText = find.byValueKey('coffee-grams-text');
      final waterText = find.byValueKey('water-grams-text');
      final timeText = find.byValueKey('total-time');

      await driver.tap(sweetMariaBtn);
      expect(await driver.getText(detailSweetMaria), "Sweet Maria's");
      expect(await driver.getText(coffeText), '22g - finely ground coffee');
      expect(await driver.getText(waterText), '360g - water');
      expect(await driver.getText(timeText), 'Total: 3:45');
    });

    /*
    Given I am on the RecipeDetailScreen
    When I tap the back button
    Then I should see "Coffee Recipes"
    */
    test('Should go back to RecipeSelectionScreen when back button is pressed',
        () async {
      final detailBackBtn = find.byValueKey('goBack');
      final recipeTitle = find.byValueKey('coffee-recipes');

      await driver.tap(detailBackBtn);
      expect(await driver.getText(recipeTitle), "Coffee Recipes");
    });

    /*
    Given I am on the RecipeDetailScreen
    When I tap the "Start" button
    Then I should see "Add 360g water"
    */
    test('Should start the steps timer when start is pressed', () async {
      final sweetMariaBtn = find.byValueKey("Sweet Maria'sButton");
      final startBtn = find.byValueKey('start-btn');
      final firstStep = find.byValueKey('recipe-step');
      final stepsBackBtn = find.byValueKey('steps-back-btn'); //FIXME
      final backBtn = find.byValueKey("goBack"); //FIXME

      await driver.tap(sweetMariaBtn);
      await driver.tap(startBtn);
      expect(await driver.getText(firstStep), 'Add 360g water');
      // Added these for ease of passing tests for now, remove later when working on steps screen
      await driver.tap(stepsBackBtn); //FIXME
      await driver.tap(backBtn); //FIXME
    });

    group("Recipe Selection Screen Tests", () {
      test("Find/Press Sweet Maria's Recipe and return", () async {
        final sweetMariaTextFinder = find.byValueKey("Sweet Maria'sText");
        final sweetMariaButtonFinder = find.byValueKey("Sweet Maria'sButton");
        final backBtn = find.byValueKey("goBack");

        expect(await driver.getText(sweetMariaTextFinder), "Sweet Maria's");
        await driver.tap(sweetMariaButtonFinder);
        await driver.tap(backBtn);
      });
      test("Find/Press Homegrounds Recipe and return", () async {
        final homegroundsTextFinder = find.byValueKey("Homegrounds RecipeText");
        final homegroundsButtonFinder =
            find.byValueKey("Homegrounds RecipeButton");
        final backBtn = find.byValueKey("goBack");

        expect(
            await driver.getText(homegroundsTextFinder), "Homegrounds Recipe");
        await driver.tap(homegroundsButtonFinder);
        await driver.tap(backBtn);
      });

      test("Find/Press Test Recipe and return", () async {
        final testRecipeTextFinder = find.byValueKey("Test_RecipeText");
        final testRecipeButtonFinder = find.byValueKey("Test_RecipeButton");
        final backBtn = find.byValueKey("goBack");

        expect(await driver.getText(testRecipeTextFinder), "Test_Recipe");
        await driver.tap(testRecipeButtonFinder);
        await driver.tap(backBtn);
      });

      test("Find/Press Test Recipe and return", () async {
        final testRecipeTextFinder = find.byValueKey("Test RecipeText");
        final testRecipeButtonFinder = find.byValueKey("Test RecipeButton");
        final backBtn = find.byValueKey("goBack");

        expect(await driver.getText(testRecipeTextFinder), "Test Recipe");
        await driver.tap(testRecipeButtonFinder);
        await driver.tap(backBtn);
      });
      test("Find/Press Coffee Resource and return", () async {
        final sweetMariaTextFinder = find.byValueKey("CoffeeResourceText");
        final sweetMariaButtonFinder = find.byValueKey("CoffeeResourceButton");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(sweetMariaTextFinder), "Coffee");
        await driver.tap(sweetMariaButtonFinder);
        await driver.tap(backBtn);
      });
      test("Find/Press Grinders Resource and return", () async {
        final grindersTextFinder = find.byValueKey("GrindersResourceText");
        final grindersButtonFinder = find.byValueKey("GrindersResourceButton");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(grindersTextFinder), "Grinders");
        await driver.tap(grindersButtonFinder);
        await driver.tap(backBtn);
      });

      test("Find/Press Kettles Resource and return", () async {
        final kettlesTextFinder = find.byValueKey("KettlesResourceText");
        final kettlesButtonFinder = find.byValueKey("KettlesResourceText");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(kettlesTextFinder), "Kettles");
        await driver.tap(kettlesButtonFinder);
        await driver.tap(backBtn);
      });

      test("Find/Press Homebrew Dripper Resource and return", () async {
        final homebrewDripperTextFinder =
            find.byValueKey("Homebrew DripperResourceText");
        final homebrewDripperButtonFinder =
            find.byValueKey("Homebrew DripperResourceButton");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(homebrewDripperTextFinder),
            "Homebrew Dripper");
        await driver.tap(homebrewDripperButtonFinder);
        await driver.tap(backBtn);
      });
    });
  });
}
