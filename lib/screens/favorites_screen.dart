import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  static const String titleScreen = 'Favorites';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites meals!'),
    );
  }
}
