import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  const FilterScreen(this.saveFilters, {required this.filters, super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutonFree = false;
  bool _luctoseFree = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutonFree = widget.filters['gluton']!;
    _luctoseFree = widget.filters['luctose']!;
    _vegan = widget.filters['vegan']!;

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function toggleChange) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (newValue) => toggleChange(newValue),
    );
  }

  saveFilters() {
              Map<String, bool> filterData = {
                'gluton': _glutonFree,
                'luctose': _luctoseFree,
                'vegan': _vegan,
              };

              widget.saveFilters(filterData);
            }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Map<String, bool> filterData = {
        //         'gluton': _glutonFree,
        //         'luctose': _luctoseFree,
        //         'vegan': _vegan,
        //       };

        //       widget.saveFilters(filterData);
        //     },
        //     icon: Icon(Icons.save),
        //   ),
        // ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Meal filtered settings',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluton Free',
                  'to filter gluton free meals',
                  _glutonFree,
                  (newValue) {
                    setState(() {
                      _glutonFree = newValue;
                      saveFilters();
                    });
                  },
                ),
                buildSwitchListTile(
                  'Luctose Free',
                  'to filter luctose free meals',
                  _luctoseFree,
                  (newValue) {
                    setState(() {
                      _luctoseFree = newValue;
                      saveFilters();
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan Filter',
                  'to filter vegan only meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                      saveFilters();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
