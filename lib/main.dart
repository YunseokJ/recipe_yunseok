import 'package:flutter/material.dart';
import 'package:recipe_search/recipe_detail_page.dart';
import 'package:recipe_search/recipe_page_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Color(0xFF111111),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        primaryColor: const Color(0xFF3BD7E2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.white,
      ),
      home: const RecipeDetailPage(),
    );
  }
}
