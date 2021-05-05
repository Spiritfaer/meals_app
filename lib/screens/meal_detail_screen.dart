import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);
  static const String routeName = '/screen-detail-meals';

  @override
  Widget build(BuildContext context) {
    final String mealsID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealsID'),
      ),
      body: Center(
        child: Text("Meal info - $mealsID"),
      ),
    );
  }
}
