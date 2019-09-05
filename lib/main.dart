import 'package:flutter/material.dart';
import 'package:flutter_meals_app/views/CategoriesPage.dart';
import 'package:flutter_meals_app/views/CategoryMealsPage.dart';
import 'package:flutter_meals_app/views/MealDetailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black,
        canvasColor: Color.fromRGBO(225, 225, 225, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              body2: TextStyle(color: Color.fromARGB(1, 50, 50, 50)),
              title: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        CategoriesPage.route: (ctx) => CategoriesPage(),
        CategoryMealsPage.route: (ctx) => CategoryMealsPage(),
        MealDetailsPage.route: (ctx) => MealDetailsPage(),
      },
//      onGenerateRoute: (settings) {
//        return MaterialPageRoute(builder: (ctx) => CategoriesPage(),);
//      },
    );
  }
}
