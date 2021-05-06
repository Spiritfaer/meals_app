import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key}) : super(key: key);
  static const String routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _swirchBuilder(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        _swirchBuilder(
          'Gluten-free',
          'Only include gluten-free meals',
          _glutenFree,
          (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          },
        ),
        _swirchBuilder(
          'Lactose-free',
          'Only include lactose-free meals',
          _lactoseFree,
          (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          },
        ),
        _swirchBuilder(
          'Vegetarian',
          'Only include vegetarian meals',
          _vegetarian,
          (newValue) {
            setState(() {
              _vegetarian = newValue;
            });
          },
        ),
        _swirchBuilder(
          'Vegan',
          'Only include vegan meals',
          _vegan,
          (newValue) {
            setState(() {
              _vegan = newValue;
            });
          },
        ),
      ]),
    );
  }
}
