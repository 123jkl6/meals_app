import "package:flutter/material.dart";
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import "../models/meal.dart"; 

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen({this.favoriteMeals}); 

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
   
  ];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages =  [{
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavoritesScreen(favoriteMeals: widget.favoriteMeals,),
      "title": "Your Favorite",
    },];

  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
        // bottom: TabBar(
        //   tabs: <Widget>[
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: "Categories",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: "Favorites",
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      // have to manually control switching of tabs.
      bottomNavigationBar: BottomNavigationBar(
        //takes int as paramter.
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type:BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
