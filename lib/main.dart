import 'package:flutter/material.dart';

import 'homepage.dart';

const Color myColor = Colors.red;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Schyler"),
      home: const HomePage(),
    );
  }
}
