import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_project/modals/meal_model.dart';

class MealDataProvider extends ChangeNotifier {
  List<MealModel> mealOneData = List.empty(growable: true);

  List<MealModel> mealTwoData = List.empty(growable: true);

  List<MealModel> mealThreeData = List.empty(growable: true);

  List<MealModel> mealFourData = List.empty(growable: true);

  List<MealModel> mealFiveData = List.empty(growable: true);

  List<MealModel> mealSixData = List.empty(growable: true);

  void addItem(List<MealModel> listName) {
    final randomNum = Random();
    listName.add(MealModel(
        mealName: "Meal${randomNum.nextInt(1000).toString()}",
        mealCalories: randomNum.nextInt(1000)));
    calculateTotalCals(listName);
    notifyListeners();
  }

  void deleteItem(List<MealModel> listName, int index) {
    listName.removeAt(index);
    calculateTotalCals(listName);
    notifyListeners();
  }

  int calculateTotalCals(List<MealModel> listName) {
    int totalCalories = listName.fold(
        0, (previousValue, element) => previousValue + element.mealCalories);
    // notifyListeners();
    return totalCalories;
  }
}
