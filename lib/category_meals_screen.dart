import 'package:flutter/material.dart';

import './models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<int, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text((routeArgs[1] as Category).title),
      ),
      body: Center(
        child: const Text('Some text on the center!'),
      ),
    );
  }
}
