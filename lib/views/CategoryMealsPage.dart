import 'package:flutter/material.dart';
import 'package:flutter_meals_app/components/MealItem.dart';
import 'package:flutter_meals_app/data/Meals.dart';

class CategoryMealsPage extends StatelessWidget {
  static String route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            id: categoryMeals[index].id,
          );
        },
        itemCount: categoryMeals.length,
      )),
    );
  }
}
