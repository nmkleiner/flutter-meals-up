import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/Meals.dart';

class MealDetailsPage extends StatelessWidget {
  static String route = '/meal';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(String text, BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Ingredients:',
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget widget) {
      return Container(
        height: 200,
        width: 300,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
        child: widget,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    )),
              )),
              SizedBox(height: 20,),
              buildContainer(ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                      Divider()
                    ],
                  ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ));
  }
}
