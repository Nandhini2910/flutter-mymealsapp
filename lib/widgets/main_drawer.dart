import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildList(IconData icon, String title, Function ontaphandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: ontaphandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome to MealsApp',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          buildList(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildList(
            Icons.settings,
            'Filter',
            () {Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
