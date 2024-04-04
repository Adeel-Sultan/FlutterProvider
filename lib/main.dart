import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_project/provider/meal_provider.dart';
import 'package:task_project/screens/meals_screen/meals_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: MaterialApp(
        title: 'Demo App',
        home: MealsScreen(),
      ),
    );
  }
}
