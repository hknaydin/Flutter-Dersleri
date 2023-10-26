import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Değeri tutmak için bir değişken tanımla
  late String _text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Widget'),
        ),
        body: Center(
          child: Card(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return NumberPickerDialog(
                      title: Text('Sayı Seçiniz'),
                      initialValue: 10,
                      minValue: 1,
                      maxValue: 100,
                      onValueChanged: (value) {
                        // Değeri texte yaz
                        setState(() {
                          _text = value.toString();
                        });
                      },
                    );
                  },
                );
              },
              child: Text(
                _text ?? 'Henüz değer seçilmedi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
