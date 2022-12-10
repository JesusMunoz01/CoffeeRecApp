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
