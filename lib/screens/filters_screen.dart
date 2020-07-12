import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';
  final Function savefilters;
  final Map<String,bool> filters;
  FiltersScreen(this.filters,this.savefilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;
  initState(){
    isGlutenFree=widget.filters['gluten'];
    isLactoseFree=widget.filters['lactose'];
    isVegan=widget.filters['vegan'];
    isVegetarian=widget.filters['vegetarian'];
    super.initState();
  }
  Widget buildSwitchListTile(
      String title, String description, bool value, Function updated) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: value,
        onChanged: updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedfilters={
                  'gluten':isGlutenFree,
                  'lactose':isLactoseFree,
                  'vegan':isVegan,
                  'vegetarian':isVegetarian

                };
                widget.savefilters(selectedfilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Adjust your selectio',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Gluten free',
                      'only include gluten free meals',
                      isGlutenFree, (newvalue) {
                    setState(() {
                      isGlutenFree = newvalue;
                    });
                  }),
                  buildSwitchListTile(
                      'vegan free', 'only include vegan free meals', isVegan,
                      (newvalue) {
                    setState(() {
                      isVegan = newvalue;
                    });
                  }),
                  buildSwitchListTile(
                      'vegetarian free',
                      'only include vegetarian free meals',
                      isVegetarian, (newvalue) {
                    setState(() {
                      isVegetarian = newvalue;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose free',
                      'only include lactose free meals',
                      isLactoseFree, (newvalue) {
                    setState(() {
                      isLactoseFree = newvalue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}
