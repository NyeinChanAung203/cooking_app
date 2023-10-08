import 'package:cooking_app/model/category.dart';
import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String categoriesID = '';
    final List<Category> fiveCategory = categoryList.where((category) {
      return category.title.contains(categoriesID);
    }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemBuilder: (context, index) {
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            );
            return CategoryItem(
              id: fiveCategory[index].id,
              title: fiveCategory[index].title,
              imgURL: fiveCategory[index].imageURL,
            );
          },
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
        ),
      ),
    );
  }
}
