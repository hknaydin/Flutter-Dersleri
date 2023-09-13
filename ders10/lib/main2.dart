import 'package:flutter/material.dart';

void main() => runApp(Uygulamam());

class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UygulamamState();
  }
}

class _UygulamamState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TextField Uygulaması"),),
        body: Container(
          child: Column(
            children:  [
              Text("Deneme"),
              TextField(),
              ElevatedButton(onPressed: (){}, child: Text("Değiştir"))
            ],
          ),
        ),
      ),
    );
  }
}