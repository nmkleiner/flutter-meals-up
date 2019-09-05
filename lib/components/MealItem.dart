import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/Meal.dart';
import 'package:flutter_meals_app/views/MealDetailsPage.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key key,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability,
      this.id})
      : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsPage.route, arguments: id);
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
      case Complexity.Challenging:
        return "challenging";
      case Complexity.Hard:
        return "hard";
      default:
        return "unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "affordable";
      case Affordability.Luxurious:
        return "luxurious";
      case Affordability.Pricey:
        return "pricey";
      default:
        return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text(
                          '$duration min',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(
                          complexityText,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(
                          affordabilityText,
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
