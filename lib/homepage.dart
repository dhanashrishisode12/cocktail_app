// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cocktail_app/drink_details.dart';
import 'package:cocktail_app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  // ignore: prefer_typing_uninitialized_variables
  var res;
  // ignore: prefer_typing_uninitialized_variables
  var drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await https.get(Uri.parse(api));
    drinks = jsonDecode(res.body)["drinks"];
    // print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [myColor, Colors.orange],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Cocktail App"),
            elevation: 0.0),
        body: Center(
          child: res != null
              ? ListView.builder(
                  // use gridView.builder
                  // ? GridView.builder(
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2),
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      title: Text(
                        "${drink["strDrink"]}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      leading: Hero(
                        tag: drink["strDrinkThumb"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                        ),
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrinkDetails(drink: drink),
                          ),
                        );
                      },
                    );
                  })
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
