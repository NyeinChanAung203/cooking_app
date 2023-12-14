import '../widgets/meals_item.dart';
import 'package:flutter/material.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId = '';
  List<Meal> mealsByCategory = [];
  String categoryTitle = '';

  @override
  void didChangeDependencies() {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    categoryTitle = routeArgs['title']!;
    categoryId = routeArgs['id']!;

    mealsByCategory = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     mealsByCategory.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        child: GridView.builder(
          // padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            return MealItem(
              id: mealsByCategory[index].id,
              title: mealsByCategory[index].title,
              imgURL: mealsByCategory[index].imgURL,
              duration: mealsByCategory[index].duration,
            );
          },
          itemCount: mealsByCategory.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
        ),
      ),
    );
  }
}
