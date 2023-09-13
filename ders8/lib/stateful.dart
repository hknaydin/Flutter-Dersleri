import 'package:flutter/material.dart';

class StatefulSayfa extends StatefulWidget{
  const StatefulSayfa({super.key});

  @override
  State<StatefulWidget> createState() {
    return StatefulSayfaState();
  }
}

class StatefulSayfaState extends State<StatefulSayfa> {
  int _currentIndex = 0;
  String _pageTitle = "Ana Sayfa"; // Başlangıçta "Ana Sayfa" metni
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
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
          title: const Text("Flutter Deneme"),
    centerTitle: true,
    backgroundColor: _getBackgroundColor(), // AppBar'ın arka plan rengi
    elevation: 2,),
        body:  Stack(
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
      ),
      debugShowCheckedModeBanner: false,

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