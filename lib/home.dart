import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for recipes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      value = _textController.text;
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
