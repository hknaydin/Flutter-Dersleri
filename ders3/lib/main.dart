import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Sayfa içeriği burada tanımlanabilir
  List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        "Ana Sayfa",
        style: TextStyle(color: Colors.red, fontSize: 26),
      ),
    ),
    Center(
      child: Text(
        "Arama",
        style: TextStyle(color: Colors.red, fontSize: 26),
      ),
    ),
    Center(
      child: Text(
        "Profil",
        style: TextStyle(color: Colors.red, fontSize: 26),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      // Arama sayfasına tıklanınca yeni bir sayfa aç
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(), // Arama sayfasının adını ve içeriğini belirtin
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İlk Flutter Denemem"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            label: "Ana Sayfa",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Arama",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama Sayfası"),
      ),
      body: Center(
        child: Text(
          "Arama Sayfası İçeriği",
          style: TextStyle(
            color: Colors.green,
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
