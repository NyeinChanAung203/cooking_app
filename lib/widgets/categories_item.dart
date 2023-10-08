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
      '/category-meals',
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
          color:  Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(imgURL),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
