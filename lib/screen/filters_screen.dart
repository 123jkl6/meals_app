import "package:flutter/material.dart";
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = "filters_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      drawer:MainDrawer(),
      body: Center(
        child: Text("Filters!"),
      ),
    );
  }
}
