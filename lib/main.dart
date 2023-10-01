import 'package:coffee_app_ui/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeAppUI());
}

class CoffeeAppUI extends StatelessWidget {
  const CoffeeAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
    );
  }
}
