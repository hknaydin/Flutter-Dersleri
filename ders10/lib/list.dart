import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override




                 return MaterialApp(
      title: 'Dropdown List Example',
      home: Scaffold(
        appBar: AppBar(title: Text('Dropdown List Example')),
        body: Center(
          child: MyDropdownLis  t(),
        ),
        backgroundColor: Colors.white, // Arka plan rengini belirleyebilirsiniz
      ),
    );
  }
}

class MyDropdownList extends StatefulWidget {
  @override
  _MyDropdownListState createState() => _MyDropdownListState();
}

class _MyDropdownListState extends State<MyDropdownList> {
  String selectedItem = 'Button 1';
  List<String> dropdownItems = ['Button 1', 'Button 2', 'Button 3', 'Button 4'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Arka plan rengini veya görüntüsünü kaldırır
      child: DropdownButton<String>(
        value: selectedItem,
        iconSize: 0.0,
        dropdownColor: null,
        elevation: 0,
        items: dropdownItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                Icon(Icons.star), // İstediğiniz ikonu burada kullanabilirsiniz
                SizedBox(width: 8.0),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue!;
          });
        },
      ),
    );
  }
}
