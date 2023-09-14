import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePAGE(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePAGE extends StatefulWidget {
  const MyHomePAGE({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _MyHomePAGEState createState() => _MyHomePAGEState();
}

class _MyHomePAGEState extends State<MyHomePAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: RichText(
            // Controls visual overflow
            overflow: TextOverflow.clip,

            // Controls how the text should be aligned horizontally
            textAlign: TextAlign.end,

            // Control the text direction
            textDirection: TextDirection.rtl,

            // Whether the text should break at soft line breaks
            softWrap: true,

            // Maximum number of lines for the text to span
            maxLines: 1,

            // The number of font pixels for each logical pixel
            textScaleFactor: 1,
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Geeks', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 100);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
