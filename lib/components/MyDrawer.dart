import 'package:flutter/material.dart';
import 'package:flutter_meals_app/views/CategoriesPage.dart';

class MyDrawer extends StatelessWidget {
  void _pushFavorites(context) {
//    Navigator.push(context, route)
  }

  void _pushCategories(context) {
    Navigator.pushReplacementNamed(context, CategoriesPage.route);
  }

  Widget buildLinkButton(String text, Function handler) {
    return FlatButton(
      onPressed: handler,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: BorderDirectional(
                end: BorderSide(
              color: Colors.yellowAccent,
              width: 4,
            ))),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            buildLinkButton('Favorites',() => _pushFavorites(context)),
            buildLinkButton('Categories',() => _pushCategories(context)),
          ],
        ),
      ),
    );
  }
}
