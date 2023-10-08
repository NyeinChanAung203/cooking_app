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
        style: Theme.of(context).textTheme.bodyLarge,
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
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imgURL,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleContainer(context, 'Ingredients'),
            buildListContainer(
              context,
              ListView.builder(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                itemBuilder: (context, index) => Text(
                  '_${selectedMeal.ingredients[index]}',
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitleContainer(context, 'Steps'),
            buildListContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text('${index + 1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
