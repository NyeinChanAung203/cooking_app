import 'dart:developer';

import 'package:cooking_app/screens/search_screen.dart';
import 'package:cooking_app/screens/splash.dart';
import 'package:cooking_app/widgets/meals_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';
import 'model/meal.dart';
import 'model/dummy_data.dart';
import './screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

const kFavorite = 'favorites';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final idList = prefs.getStringList(kFavorite);
      print('idlist $idList');
      if (idList != null) {
        for (var id in idList) {
          final index = MealsList.indexWhere((element) => element.id == id);
          final meal = MealsList[index];
          favoriteMeals.add(meal);
        }
      }
    });
  }

  List<Meal> availableMeals = MealsList;
  List<Meal> favoriteMeals = [];

  bool isFavoriteMeal(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavorite(String mealId) async {
    int existedIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (existedIndex >= 0) {
        favoriteMeals.removeAt(existedIndex);
      } else {
        favoriteMeals.add(MealsList.firstWhere((meal) => meal.id == mealId));
      }
    });
    final idList = favoriteMeals.map((e) => e.id).toList();
    print('idlist $idList');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(kFavorite, idList);
  }

  void _saveFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = MealsList.where((meal) {
        if (filters['gluton']! && !meal.isGluton) {
          return false;
        } else if (filters['luctose']! && !meal.isLuctose) {
          return false;
        } else if (filters['vegan']! && !meal.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    log('build main');
    return MaterialApp(
      title: 'Cooking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pinkAccent,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => TabScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        Search.routeName: (context) => const Search(),
        MealItem.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, isFavoriteMeal),
        FilterScreen.routeName: (context) => FilterScreen(
              _saveFilters,
              filters: filters,
            ),
      },
    );
  }
}
