import "package:flutter/material.dart";

import "../models/meal.dart";

import "../widgets/meal_item.dart";

import "../dummy-data.dart";

//state management covered in later courses will negate the use of StatefulWidget here.
class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen({this.favoriteMeals});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> _favoriteMeals;
  bool _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      _favoriteMeals = widget.favoriteMeals.toList();
      _loadedInitData = true;
    }
  }

  _updateFavoritesScreenMeals(String mealId) {
    final existingIndex =
        widget.favoriteMeals.indexWhere((oneMeal) => oneMeal.id == mealId);
    //add
    if (existingIndex < 0) {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((oneMeal)=>oneMeal.id==mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.removeWhere((oneMeal)=>oneMeal.id==mealId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text("No favorites."),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (ctx, idx) => MealItem(
          id: widget.favoriteMeals[idx].id,
          title: widget.favoriteMeals[idx].title,
          imageUrl: widget.favoriteMeals[idx].imageUrl,
          duration: widget.favoriteMeals[idx].duration,
          complexity: widget.favoriteMeals[idx].complexity,
          affordability: widget.favoriteMeals[idx].affordability,
          updateFavoritesScreen: _updateFavoritesScreenMeals,
        ),
      );
    }
  }
}
