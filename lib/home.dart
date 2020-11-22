import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/services/apihelper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<ApiHelper>(context);
    return Consumer<ApiHelper>(
      builder: (context, data, child) => Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _textController,
              onSubmitted: (val) {
                value = _textController.text;
              },
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    value = _textController.text;
                    data.fetchRecipes(value);
                  })
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit),
            onPressed: () {
              data.fetchRecipes(value);
            },
          ),
          body: GridView.builder(
            itemCount: data.recipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new GridTile(
                    footer: Text(data.recipes[index].title != null
                        ? data.recipes[index].title
                        : "loading"),
                    child: CachedNetworkImage(
                      imageUrl: data.recipes[index].imgUrl,
                      fit: BoxFit.cover,
                    )),
              );
            },
          )),
    );
  }
}
