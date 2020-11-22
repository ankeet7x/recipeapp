import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'mapper.dart';

class ApiHelper extends ChangeNotifier {
  ApiHelper() {
    this.fetchRecipes();
  }

  List<Recipes> recipes = [];

  Future<void> fetchRecipes() async {
    String url =
        "https://api.spoonacular.com/recipes/complexSearch?query=noodles&apiKey=65bbd9a31686455396738f6b5dc4ebb4";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element) {
      Recipes recipe =
          Recipes(title: element['title'], imgUrl: element['imgUrl']);
      recipes.add(recipe);
    });
    notifyListeners();
    print("Fetched");
    // print(jsonData);
  }
}
