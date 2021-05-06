import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key key, this.saveFilters, this.curentFilters})
      : super(key: key);
  static const String routeName = '/filters-screen';
  final Function saveFilters;
  final Map<String, bool> curentFilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.curentFilters['gluten'];
    _lactoseFree = widget.curentFilters['lactose'];
    _vegan = widget.curentFilters['vegan'];
    _vegetarian = widget.curentFilters['vegetarian'];
  }

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
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
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
