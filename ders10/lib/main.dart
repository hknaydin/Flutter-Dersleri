import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Floating Action"),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    bottomNavigationBar: BottomAppBar(
      color: Colors.limeAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.blue,
              size: 40,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {},
      heroTag: "AnaSayfa",
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      label: Text(
        "Merhaba Flutter",
        style: TextStyle(fontSize: 20),
      ),
      icon: Icon(Icons.add_alert),
    ),
  ),
  debugShowCheckedModeBanner: false,
));