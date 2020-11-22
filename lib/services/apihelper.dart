import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'mapper.dart';

class ApiHelper extends ChangeNotifier {
  // ApiHelper() {
  //   this.fetchRecipes("pasta");
  // }

  int currentIndex;
  setCurrentIndex(int index) {
    currentIndex = index;
  }

  List<Recipes> recipes = [];

  Future<void> fetchRecipes(value) async {
    recipes.clear();
    String url =
        "https://api.spoonacular.com/recipes/complexSearch?query=$value&apiKey=YOUR_API_KEY";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element) {
      Recipes recipe =
          Recipes(title: element['title'], imgUrl: element['image']);

      recipes.add(recipe);
    });
    notifyListeners();
    print("Fetched");
    // print(jsonData);
  }
}
