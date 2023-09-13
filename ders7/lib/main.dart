import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("FLUTTER CONTAINER YAPISI"),
      centerTitle: true,
      backgroundColor: Colors.cyan, // AppBar'ın arka plan rengi
      elevation: 2, // Border eklemek için elevation değerini ayarlayabilirsiniz
    ),
    body: Container(
      width: double.infinity,
      height:200,
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
        boxShadow:
        const [BoxShadow(
            color: Colors.purple,
            spreadRadius: 10,
            blurRadius: 10)
        ],
      ),
      child: const Text("Container decoration özelliği",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
  debugShowCheckedModeBanner: false,
),
);
