import "package:flutter/material.dart"; 

import "../models/meal.dart"; 

import "../widgets/meal_item.dart"; 

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen({this.favoriteMeals}); 

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
    return Center(
      child: Text("No favorites."),
    );} else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, idx) => MealItem(
          id: favoriteMeals[idx].id,
          title: favoriteMeals[idx].title,
          imageUrl: favoriteMeals[idx].imageUrl,
          duration: favoriteMeals[idx].duration,
          complexity: favoriteMeals[idx].complexity,
          affordability: favoriteMeals[idx].affordability,
          
        ),
      );
    }
  }
}