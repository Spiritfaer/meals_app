import 'package:flutter/material.dart';

import '../models/category.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = 'screen-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<int, Object>;
    final categoriesTitle = (routeArgs[1] as Category).title;
    final categoriesId = (routeArgs[1] as Category).id;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoriesId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoriesTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
