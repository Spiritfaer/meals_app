import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  CategoryMealsScreen({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: const Text('Some text on the center!'),
      ),
    );
  }
}
