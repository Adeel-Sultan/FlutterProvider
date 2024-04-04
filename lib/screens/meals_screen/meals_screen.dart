import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_project/provider/meal_provider.dart';
import 'package:task_project/widgets/meal_tile.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MealDataProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meals",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      size: 45,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        MealTile(
                          title: 'Meal One',
                          icon: CupertinoIcons.sunrise_fill,
                          mealData: provider.mealOneData,
                          onTap: () {
                            provider.addItem(provider.mealOneData);
                          },
                        ),
                        MealTile(
                          title: 'Meal Two',
                          icon: CupertinoIcons.square_fill_on_square_fill,
                          mealData: provider.mealTwoData,
                          onTap: () {
                            provider.addItem(provider.mealTwoData);
                          },
                        ),
                        MealTile(
                          title: 'Meal Three',
                          icon: CupertinoIcons.sun_min_fill,
                          mealData: provider.mealThreeData,
                          onTap: () {
                            provider.addItem(provider.mealThreeData);
                          },
                        ),
                        MealTile(
                          title: 'Meal Four',
                          icon: CupertinoIcons.sunset_fill,
                          mealData: provider.mealFourData,
                          onTap: () {
                            provider.addItem(provider.mealFourData);
                          },
                        ),
                        MealTile(
                          title: 'Meal Five',
                          icon: CupertinoIcons.moon_fill,
                          mealData: provider.mealFiveData,
                          onTap: () {
                            provider.addItem(provider.mealFiveData);
                          },
                        ),
                        MealTile(
                          title: 'Meal Six',
                          icon: CupertinoIcons.moon_stars_fill,
                          mealData: provider.mealSixData,
                          onTap: () {
                            provider.addItem(provider.mealSixData);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
