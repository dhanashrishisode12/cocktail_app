import 'package:cocktail_app/main.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  final drink;
  const DrinkDetails({super.key, this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(drink["strDrink"]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["strDrinkThumb"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                // drink["idDrink"],
                "ID:${drink["idDrink"]}",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                drink["strDrink"],
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
