import "package:flutter/material.dart";

import "../dummy-data.dart";

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "categories_meal_screen";
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId,this.categoryTitle,});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where(
          (oneMeal) => oneMeal.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, idx) => Text(categoryMeals[idx].title),
      ),
    );
  }
}
