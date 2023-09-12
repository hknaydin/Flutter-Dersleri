import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("İlk Flutter Denemem"),
          ),
          body: const Center(
            child: Text(
              "İlk Uygulamam",
              style: TextStyle(
                  color: Colors.red, fontSize: 26
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Menü',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Menü 1'),
                ),
                ListTile(
                  title: Text('Menü 2'),
                ),
              ],
            ),
          ),

        ),
      )
  );
}