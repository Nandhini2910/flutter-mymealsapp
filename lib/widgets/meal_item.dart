import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageurl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  
  MealItem(
      {
        this.id,
        this.title,
      this.imageurl,
      this.duration,
      this.complexity,
      this.affordability,
      });

  String get complexityText{
    switch (complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging'; 
        break;
      default:
        return 'unknown';
    }
  }    
   String get affordabilityText{
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey'; 
        break;
      default:
        return 'unknown';
    }
  } 
  void selecter(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: id ).then((result) {
      if(result!=null){
        //removeItem(result);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
     
    return InkWell(onTap:()=> selecter(context),
    splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
          child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageurl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 250,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(padding: const EdgeInsets.all(15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                     SizedBox(width: 10,),
                    Text('$duration min')
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.shop),
                    SizedBox(width: 10,),
                    Text(complexityText)
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.attach_money),
                     SizedBox(width: 10,),
                    Text(affordabilityText)
                  ],),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
