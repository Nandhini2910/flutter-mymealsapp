import 'package:flutter/material.dart';
import './dummy_data.dart';

import './screens/category_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favoritemeals=[];
  
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((meal) {
       if(_filters['gluten'] && !meal.isGlutenFree)
       {
         return false;
       }
       if(_filters['lactose'] && !meal.isLactoseFree)
       {
         return false;
       }
       if(_filters['vegan'] && !meal.isVegan)
       {
         return false;
       }
       if(_filters['vegetarian'] && !meal.isVegetarian)
       {
         return false;
       }
       return true;
      }).toList();
    });
  }
  void _togglefavorite(String mealid){
    final existingIndex=_favoritemeals.indexWhere((meal) => meal.id==mealid);
    if(existingIndex>=0){
      setState(() {
        _favoritemeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoritemeals.add(DUMMY_MEALS.firstWhere((meal) => mealid==meal.id));
      });
    }
  }
  bool _ismealfavorite(String id){
    return _favoritemeals.any((meal) => meal.id==id);
  }
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline3: TextStyle(
              color: Colors.black,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(_favoritemeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_togglefavorite,_ismealfavorite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
    );
  }
}
