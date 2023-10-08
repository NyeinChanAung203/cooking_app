import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgURL;

  const CategoryItem({
    required this.title,
    required this.id,
    required this.imgURL,
    super.key,
  });

  void navigateToMeals(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/home_meals',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToMeals(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 215, 191, 118),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(imgURL),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
