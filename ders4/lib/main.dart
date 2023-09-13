

import 'package:flutter/material.dart';

void main()=>runApp(const Uygulamam());

class Uygulamam extends StatelessWidget{
  const Uygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              "Flutter AppBar",
            textAlign: TextAlign.center, // Yazıyı ortalamak için textAlign kullanın
          ),
          centerTitle: true, // AppBar'ın başlığını ortalamak için centerTitle'i true yapın
        ),
        body: const Center(
          child: Text("Flutter Body",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}

