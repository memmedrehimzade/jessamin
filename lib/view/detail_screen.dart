//import 'package:dicoding_submission/view/home_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

//import 'home_screen.dart';
// import 'package:dicoding_submission/models/meal.dart';

class MealDetailWidget extends StatelessWidget {
  final Meal meal;
  MealDetailWidget(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            meal.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getDetail());
  }

  getDetail() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(meal.title),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(3.0),
              child: Text(
                meal.title,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ingredient :",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Instructions :",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
