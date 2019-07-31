import "package:flutter/material.dart";
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final MealComplexity complexity;
  final Affordability affordability;
  final Function updateFavoritesScreen;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    this.updateFavoritesScreen,
  });

  String get complexityText {
    switch (complexity) {
      case (MealComplexity.Simple):
        {
          return "Simple";
        }
      case (MealComplexity.Hard):
        {
          return "Hard";
        }
      case (MealComplexity.Challenging):
        {
          return "Challenging";
        }
      default:
        {
          return "Unknown";
        }
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case (Affordability.Affordable):
        {
          return "Affordable";
        }
      case (Affordability.Pricey):
        {
          return "Pricey";
        }
      case (Affordability.Luxurious):
        {
          return "Luxurious";
        }
      default:
        {
          return "Unknown";
        }
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((mealId) {
      print(mealId);
      if (mealId!=null){
        updateFavoritesScreen(mealId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                //round only topLeft and topRight
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //position relative from bottom right.
                  bottom: 20,
                  right: 10,
                  child: Container(
                    //restrict width to prevent text from overflowing
                    width: 300,
                    //ensure readable text
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      //prevent text overflow.
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
