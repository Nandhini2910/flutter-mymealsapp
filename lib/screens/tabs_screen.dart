import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import '../models/meals.dart';


class TabsScreen extends StatefulWidget {
  final List<Meal> favoritemeals;
  TabsScreen(this.favoritemeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String,Object>> _pages;
  int _selectedIndex=0;
  @override
  void initState() {
    _pages=[
    {'page':CategoryScreen(),'title':'Categories'},
    {'page':FavoriteScreen(widget.favoritemeals),'title':'Favorites'},
    
  ];
       super.initState();
  }
  void _selectPage(int index){
  setState(() {
    _selectedIndex=index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex]['title']),
          
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ]),
      ),
    );
  }
}
