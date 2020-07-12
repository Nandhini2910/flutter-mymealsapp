import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/meals.dart';

class CategoryMeals extends StatefulWidget {
 final  List<Meal> availableMeals;
 CategoryMeals(this.availableMeals);
  //final String catid;
  //final String cattitle;
  //CategoryMeals(this.catid,this.cattitle);
  static const routeName = '/category-meals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String cattitle;
  List<Meal> categoryMeals;
  bool _loading=false;

  void didChangeDependencies(){
    if(_loading==false){
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    cattitle = routeargs['title'];
    final catid = routeargs['id'];
     categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(catid);
    }).toList();
    _loading=true;
    }
    super.didChangeDependencies();
  }
  //void _removeItem(String mealid){
  //  setState(() {
  //    categoryMeals.removeWhere((meal) => meal.id==mealid);
  //  });
  //}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(cattitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
                imageurl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                duration: categoryMeals[index].duration,
                
                );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
