import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Floating Action Button"),
      centerTitle: true,
        backgroundColor: Colors.amber, // AppBar'ın arka plan rengi
        elevation: 2,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      heroTag: "AnaSayfa",
      child: const Icon(Icons.add),
    ),
  ),
  debugShowCheckedModeBanner: false,
));