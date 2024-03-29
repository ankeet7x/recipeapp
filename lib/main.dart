import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/services/apihelper.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiHelper(),
      child: MaterialApp(
        title: "Recipe app",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
