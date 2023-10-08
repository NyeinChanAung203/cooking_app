import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Mr.Cooking!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            Icons.settings,
            'Filters',
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
