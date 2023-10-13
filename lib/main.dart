import 'dart:developer';

import 'package:cooking_app/screens/search_screen.dart';
import 'package:cooking_app/widgets/meals_item.dart';
import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';
import 'model/meal.dart';
import 'model/dummy_data.dart';
import './screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 

  List<Meal> availableMeals = MealsList;
  List<Meal> favoriteMeals = [];

  bool isFavoriteMeal(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavorite(String mealId) {
  
    int existedIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    setState(() {
      if (existedIndex >= 0) {
        
        favoriteMeals.removeAt(existedIndex);
      } else {
        
        favoriteMeals.add(MealsList.firstWhere((meal) => meal.id == mealId));
      }
      
    });
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xfff6f4fa),
          primary: Color.fromARGB(255, 245, 52, 45),
          secondary: Color.fromARGB(255, 49, 69, 196),
        ),
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromARGB(148, 0, 0, 0)),
              displayLarge: TextStyle(
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
                fontSize: 100,
                color: Color(0xfff3C444C),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
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
