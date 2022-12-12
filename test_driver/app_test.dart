// Imports the Flutter Driver API.
import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:clock/clock.dart';

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

    group("Happy Paths", () {
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
      test(
          'Should go back to RecipeSelectionScreen when back button is pressed',
          () async {
        final detailBackBtn = find.byValueKey('goBack');
        final recipeTitle = find.byValueKey('coffee-recipes');

        await driver.tap(detailBackBtn);
        expect(await driver.getText(recipeTitle), "Coffee Recipes");
      });

      /*
    Given I am on the Sweet Maria's RecipeDetailScreen
    When I tap the "Start" button
    Then I should see "30"
    And I should see "Add 360g water"
    When 30 seconds have passed
    Then I should see "90"
    And I should see "Cover and wait"
    When 90 seconds have passed
    Then I should see "15"
    And I should see "Stir"
    When 15 seconds have passed
    Then I should see "75"
    And I should see "Cover and wait"
    When 75 seconds have passed
    Then I should see "15"
    And I should see "Stir"
    When 15 seconds have passed
    Then I should see "Enjoy your amazing handmade coffee"
    And press the done button
    */
      test('Should start the steps timer when start is pressed', () async {
        final sweetMariaBtn = find.byValueKey("Sweet Maria'sButton");
        final startBtn = find.byValueKey('start-btn');
        final firstStep = find.byValueKey('recipeStep0');
        final firstStepTimer = find.byValueKey("startTime0");
        final doneBtn = find.byValueKey('DoneBtn');

        await driver.tap(sweetMariaBtn);
        await driver.tap(startBtn);

        expect(await driver.getText(firstStepTimer), "30");
        expect(
          await driver.getText(firstStep),
          'Add 360g water',
        );

        final secondStep = find.byValueKey('recipeStep1');
        final secondStepTimer = find.byValueKey("startTime1");
        expect(await driver.getText(secondStepTimer), "90");
        expect(await driver.getText(secondStep), "Cover and wait");

        final thirdStep = find.byValueKey('recipeStep2');
        final thirdStepTimer = find.byValueKey("startTime2");
        expect(await driver.getText(thirdStepTimer), "15");
        expect(await driver.getText(thirdStep), "Stir");

        final fourthStep = find.byValueKey('recipeStep3');
        final fourthStepTimer = find.byValueKey("startTime3");
        expect(await driver.getText(fourthStepTimer), "75");
        expect(await driver.getText(fourthStep), "Cover and wait");

        final fifthStep = find.byValueKey('recipeStep4');
        final fifthStepTimer = find.byValueKey("startTime4");
        expect(await driver.getText(fifthStepTimer), "15");
        expect(await driver.getText(fifthStep), "Stir");

        await driver.tap(doneBtn);
      }, timeout: Timeout(Duration(seconds: 600)));
    });

    group("Sad Path", () {
      /*
    Given I am on the Sweet Maria's RecipeDetailScreen
    When I tap the "Start" button
    Then I should see "30"
    And I should see "Add 360g water"
    When 30 seconds have not passed
    Then I should still see "Add 360g water"

    When 30 seconds have passed
    Then I should see "90"
    And I should see "Cover and wait"
    When 90 seconds have not passed
    Then I should still see "Cover and wait"
  
    When 90 seconds have passed
    Then I should see "15"
    And I should see "Stir"
    When 15 seconds have not passed
    Then I should still see "Stir"

    When 15 seconds have passed
    Then I should see "75"
    And I should see "Cover and wait"
    When 75 seconds have not passed
    Then I should still see "Cover and wait"
  
    When 75 seconds have passed
    Then I should see "15"
    And I should see "Stir"
    When 15 seconds have not passed
    Then I should still see "Stir"

    When 15 seconds have passed
    Then I should see "Enjoy your amazing handmade coffee"
    And press the done button
    */
      test('Should start the steps timer when start is pressed', () async {
        final sweetMariaBtn = find.byValueKey("Sweet Maria'sButton");
        final startBtn = find.byValueKey('start-btn');
        final firstStep = find.byValueKey('recipeStep0');
        final firstStepTimer = find.byValueKey("startTime0");
        final doneBtn = find.byValueKey('DoneBtn');

        await driver.tap(sweetMariaBtn);
        await driver.tap(startBtn);

        expect(await driver.getText(firstStepTimer), "30");
        expect(
          await driver.getText(firstStep),
          'Add 360g water',
        );
        await Future.delayed(Duration(seconds: 15));
        expect(
          await driver.getText(firstStep),
          'Add 360g water',
        );

        final secondStep = find.byValueKey('recipeStep1');
        final secondStepTimer = find.byValueKey("startTime1");
        expect(await driver.getText(secondStepTimer), "90");
        expect(await driver.getText(secondStep), "Cover and wait");
        await Future.delayed(Duration(seconds: 75));
        expect(await driver.getText(secondStep), "Cover and wait");

        final thirdStep = find.byValueKey('recipeStep2');
        final thirdStepTimer = find.byValueKey("startTime2");
        expect(await driver.getText(thirdStepTimer), "15");
        expect(await driver.getText(thirdStep), "Stir");
        await Future.delayed(Duration(seconds: 5));
        expect(await driver.getText(thirdStep), "Stir");

        final fourthStep = find.byValueKey('recipeStep3');
        final fourthStepTimer = find.byValueKey("startTime3");
        expect(await driver.getText(fourthStepTimer), "75");
        expect(await driver.getText(fourthStep), "Cover and wait");
        await Future.delayed(Duration(seconds: 45));
        expect(await driver.getText(fourthStep), "Cover and wait");

        final fifthStep = find.byValueKey('recipeStep4');
        final fifthStepTimer = find.byValueKey("startTime4");
        expect(await driver.getText(fifthStepTimer), "15");
        expect(await driver.getText(fifthStep), "Stir");
        await Future.delayed(Duration(seconds: 10));
        expect(await driver.getText(fifthStep), "Stir");

        await driver.tap(doneBtn);
      }, timeout: Timeout(Duration(seconds: 600)));
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
        final testRecipeTextFinder = find.byValueKey("Texas Coffee RecipeText");
        final testRecipeButtonFinder =
            find.byValueKey("Texas Coffee RecipeButton");
        final backBtn = find.byValueKey("goBack");

        expect(
            await driver.getText(testRecipeTextFinder), "Texas Coffee Recipe");
        await driver.tap(testRecipeButtonFinder);
        await driver.tap(backBtn);
      });

      test("Find/Press PT's Recipe and return", () async {
        final testRecipeTextFinder = find.byValueKey("PT'sText");
        final testRecipeButtonFinder = find.byValueKey("PT'sButton");
        final backBtn = find.byValueKey("goBack");

        expect(await driver.getText(testRecipeTextFinder), "PT's");
        await driver.tap(testRecipeButtonFinder);
        await driver.tap(backBtn);
      });
      test("Find/Press Coffee Resource and return", () async {
        final coffeeTextFinder = find.byValueKey("CoffeeResourceText");
        final coffeeButtonFinder = find.byValueKey("CoffeeResourceButton");
        final link = find.byValueKey("linkText");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(coffeeTextFinder), "Coffee");
        await driver.tap(coffeeButtonFinder);
        expect(await driver.getText(link),
            "https://www.homegrounds.co/best-coffee-beans-bucket-list/");
        await driver.tap(backBtn);
      });
      test("Find/Press Grinders Resource and return", () async {
        final grindersTextFinder = find.byValueKey("GrindersResourceText");
        final grindersButtonFinder = find.byValueKey("GrindersResourceButton");
        final link = find.byValueKey("linkText");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(grindersTextFinder), "Grinders");
        await driver.tap(grindersButtonFinder);
        expect(await driver.getText(link),
            "https://www.homegrounds.co/best-hand-coffee-grinders/");
        await driver.tap(backBtn);
      });

      test("Find/Press Kettles Resource and return", () async {
        final kettlesTextFinder = find.byValueKey("KettlesResourceText");
        final kettlesButtonFinder = find.byValueKey("KettlesResourceText");
        final link = find.byValueKey("linkText");
        final backBtn = find.byValueKey("goBackR");

        expect(await driver.getText(kettlesTextFinder), "Kettles");
        await driver.tap(kettlesButtonFinder);
        expect(await driver.getText(link),
            "https://www.homegrounds.co/5-best-pour-coffee-kettles-gooseneck-kettles-reviewed/");
        await driver.tap(backBtn);
      });

      test("Find/Press Homebrew Dripper Resource and return", () async {
        final homebrewDripperTextFinder =
            find.byValueKey("Homebrew DripperResourceText");
        final homebrewDripperButtonFinder =
            find.byValueKey("Homebrew DripperResourceButton");
        final backBtn = find.byValueKey("goBackR");
        final link = find.byValueKey("linkText");

        expect(await driver.getText(homebrewDripperTextFinder),
            "Homebrew Dripper");
        await driver.tap(homebrewDripperButtonFinder);
        expect(await driver.getText(link),
            "https://www.homegrounds.co/best-drip-coffee-maker-reviews/");
        await driver.tap(backBtn);
      });
    });
  });
}
