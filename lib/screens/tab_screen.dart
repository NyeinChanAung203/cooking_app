import 'package:cooking_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../model/meal.dart';
import '../screens/home.dart';
//import '../screens/search_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedItemIndex = 0;

  void _selectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _pages = [
      {
        'page': Home(),
        'title': 'Mrs.Cooking',
      },
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': Search(),
        'title': 'Search',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Favorite Meals',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[selectedItemIndex]['title'] as String,
        ),
      ),
      body: _pages[selectedItemIndex]['page'] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectItem,
        currentIndex: selectedItemIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Color.fromARGB(67, 175, 144, 77),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
