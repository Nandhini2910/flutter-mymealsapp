import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function togglefavorites;
  final Function isfavorite;
  MealDetailScreen(this.togglefavorites,this.isfavorite);
 
   
  Widget buildTextContainer(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        padding: EdgeInsets.all(8),
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeargs = ModalRoute.of(context).settings.arguments as String;
    final mealid = routeargs;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              buildTextContainer(context, 'INGREDIENTS'),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        ),
                    itemCount: selectedMeal.ingredients.length),
              ),
              buildTextContainer(context, 'STEPS'),
              buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${(index + 1)}'),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(),
                        ],
                      ),
                  itemCount: selectedMeal.steps.length))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isfavorite(mealid)?Icons.star:Icons.star_border),
          onPressed: () {
            togglefavorites(mealid);
          },
        ));
  }
}
