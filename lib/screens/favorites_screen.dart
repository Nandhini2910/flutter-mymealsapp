import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritemeals;
  FavoriteScreen(this.favoritemeals);
  @override
  Widget build(BuildContext context) {
    if(favoritemeals.isEmpty){
       return Center(child: Text('You have no favorites start adding some'),);
    }
    else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritemeals[index].id,
                imageurl:favoritemeals [index].imageUrl,
                title: favoritemeals[index].title,
                complexity: favoritemeals[index].complexity,
                affordability: favoritemeals[index].affordability,
                duration: favoritemeals[index].duration,
                
                );
          },
          itemCount: favoritemeals.length,
        );
    }
    
      
  
  }
}