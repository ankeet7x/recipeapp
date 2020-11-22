import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/services/apihelper.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ApiHelper>(
      builder: (context, data, child) => Scaffold(
          appBar: AppBar(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Hero(
                tag: 'img' + data.currentIndex.toString(),
                child: CachedNetworkImage(
                  imageUrl: data.recipes[data.currentIndex].imgUrl,
                  fit: BoxFit.cover,
                ),
              )
            ],
          )),
    );
  }
}
