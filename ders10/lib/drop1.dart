import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.tealAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selected;
  final List<Map> _myJson = [
    {'id': '1', 'image': 'assets/images/mbbank.png', 'name': 'MB Bank'},
    {'id': '2', 'image': 'assets/images/tpbank.png', 'name': 'TP Bank'},
    {
      'id': '3',
      'image': 'assets/images/techcombank.png',
      'name': 'TechcomBank'
    },
    {'id': '4', 'image': 'assets/images/vietcombank.png', 'name': 'VietcomBank'}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown List Width Images'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              hint: const Text('Select Bank'),
                              value: _selected,
                              onChanged: (newValue) {
                                setState(() {
                                  _selected = newValue as String;
                                });
                              },
                              items: _myJson.map((Map map) {
                                return DropdownMenuItem(
                                  value: map['id'].toString(),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        map['image'],
                                        width: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(map['name']),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ..._myJson
                    .where((element) => element['id'] == _selected)
                    .map((e) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: _selected == null
                              ? Image.asset('assets/images/img.png')
                              : Image.asset(e['image']),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                if (_selected == null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: Image.asset('assets/images/img.png'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
