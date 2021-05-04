import 'package:flutter/material.dart';

import './models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = 'screen-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<int, Object>;
    final categoriesTitle = (routeArgs[1] as Category).title;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesTitle),
      ),
      body: Center(
        child: const Text('Some text on the center!'),
      ),
    );
  }
}
