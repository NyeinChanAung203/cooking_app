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
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.pink.withOpacity(0.3),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imgURL),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
