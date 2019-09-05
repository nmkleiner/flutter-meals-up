import 'package:flutter/material.dart';
import 'package:flutter_meals_app/components/MyDrawer.dart';
import '../data/Categories.dart';
import '../components/CategoryItem.dart';
import '../data/Meals.dart';

class CategoriesPage extends StatelessWidget {
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'bonApetit',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      drawer: MyDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((category) =>
                CategoryItem(category.id, category.title, category.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
