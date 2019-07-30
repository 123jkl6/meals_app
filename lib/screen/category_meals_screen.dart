import "package:flutter/material.dart";
import 'package:meals_app/widgets/meal_item.dart';

import "../models/meal.dart"; 

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "categories_meal_screen";
  final List<Meal> availableMeals;

  CategoryMealsScreen({this.availableMeals}); 

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _categoryTitle;
  List<Meal> _displayedMeals;
  //flag to check that page is run only when it is first pushed onto the stack
  ///so that the list will not be reloaded the meal_detail_screen is popped. 
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  //trigged after state change
  //before build and after init
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    _categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    _displayedMeals = widget.availableMeals
        .where(
          (oneMeal) => oneMeal.categories.contains(categoryId),
        )
        .toList();
        _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState((){
      _displayedMeals.removeWhere((meal)=>meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs["title"];
    // final categoryId = routeArgs["id"];
    // final _displayedMeals = DUMMY_MEALS
    //     .where(
    //       (oneMeal) => oneMeal.categories.contains(categoryId),
    //     )
    //     .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemCount: _displayedMeals.length,
        itemBuilder: (ctx, idx) => MealItem(
          id: _displayedMeals[idx].id,
          title: _displayedMeals[idx].title,
          imageUrl: _displayedMeals[idx].imageUrl,
          duration: _displayedMeals[idx].duration,
          complexity: _displayedMeals[idx].complexity,
          affordability: _displayedMeals[idx].affordability,
          removeItem: _removeMeal,
        ),
      ),
    );
  }
}
