import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: AppNavigator(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AppNavigator extends StatefulWidget {
  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Burada mail iconuna tıklama işlevi ekleyebilirsiniz.
              // Örneğin, yeni bir sayfa açabilirsiniz.
            },
            icon: const Icon(Icons.mail),
          ),
          IconButton(
            onPressed: () {
              // Burada profil iconuna tıklama işlevi ekleyebilirsiniz.
              // Örneğin, yeni bir sayfa açabilirsiniz.
            },
            icon: const Icon(Icons.person),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            // Burada menü iconuna tıklama işlevi ekleyebilirsiniz.
            // Örneğin, bir yan menü açabilirsiniz.
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text("AppBar Örnek"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ara',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ana Sayfa"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profil Sayfası"),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ara Sayfası"),
    );
  }
}
