import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('There is no favorite meals!'),
          )
        : GridView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imgURL: favoriteMeals[index].imgURL,
                duration: favoriteMeals[index].duration,
              );
            },
            itemCount: favoriteMeals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
          );
  }
}
