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
  String _pageTitle = "Ana Sayfa"; // Başlangıçta "Ana Sayfa" metni
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
        title: Text("AppBar Örnek"), // Dinamik olarak değişen metni kullan
        centerTitle: true,
        backgroundColor: _getBackgroundColor(), // AppBar'ın arka plan rengi
        elevation: 2, // Border eklemek için elevation değerini ayarlayabilirsiniz
      ),
      body: Stack(
        children: [
          Container(
            color: _getBackgroundColor(), // Ortadaki metinlerin arka plan rengi
          ),
          Center(
            child: Text(
              _pageTitle,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Sayfa değiştikçe _pageTitle'i güncelle
            if (index == 0) {
              _pageTitle = "Ana Sayfa";
            } else if (index == 1) {
              _pageTitle = "Profil";
            } else if (index == 2) {
              _pageTitle = "Ara";
            }
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

  Color? _getBackgroundColor() {
    // İstenilen arka plan rengini döndüren işlev
    switch (_currentIndex) {
      case 0:
        return Colors.blue[300];
      case 1:
        return Colors.green[300];
      case 2:
        return Colors.orange[300];
      default:
        return Colors.blue[300];
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300], // Ana Sayfa içeriğinin arka plan rengi
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[300], // Profil Sayfası içeriğinin arka plan rengi
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[300], // Ara Sayfası içeriğinin arka plan rengi
    );
  }
}
