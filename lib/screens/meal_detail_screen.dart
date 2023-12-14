import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../model/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavoriteMeal;

  const MealDetailScreen(this.toggleFavorite, this.isFavoriteMeal, {super.key});

  Widget buildTitleContainer(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildListContainer(BuildContext context, Widget child) {
    return Container(
        height: 200,
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final Meal selectedMeal = MealsList.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
            onPressed: () => toggleFavorite(mealId),
            icon: isFavoriteMeal(mealId)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.pinkAccent,
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Hero(
                    tag: selectedMeal.imgURL,
                    child: Image.asset(
                      selectedMeal.imgURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              buildTitleContainer(context, 'Ingredients'),
              const SizedBox(
                height: 8,
              ),
              ...selectedMeal.ingredients.map((e) => Text(
                    '- ${e}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              const SizedBox(height: 16),
              buildTitleContainer(context, 'Steps'),
              ...List.generate(
                selectedMeal.steps.length,
                (index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    selectedMeal.steps[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
