import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Floating Action"),
      centerTitle: true,
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
    floatingActionButton: Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(15),
            child: FloatingActionButton(
              onPressed: () {
                //action code for button 1
              },
              child: const Icon(Icons.add),
            )), //button first

        Container(
            margin: const EdgeInsets.all(15),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            )),

        Container(
            margin: const EdgeInsets.all(15),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.deepOrangeAccent,
              child: const Icon(Icons.add),
            )),

        // Add more buttons here
      ],
    ),
  ),
  debugShowCheckedModeBanner: false,
));