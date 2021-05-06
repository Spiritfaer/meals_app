import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/screen-meals';

  List<Meal> availableMeals;

  CategoryMealsScreen({this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoriesTitle;
  String categoriesId;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<int, Object>;
      categoriesTitle = (routeArgs[1] as Category).title;
      categoriesId = (routeArgs[1] as Category).id;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoriesId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeals(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoriesTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
