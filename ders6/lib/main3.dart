import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: AppNavigator(),
        appBar: AppBar(
          actions:  [ //içerisine liste alır, iconlar ekledik
            IconButton(onPressed: (){}, icon: const Icon(Icons.mail)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.person))
          ],
          leading: IconButton(onPressed:(){}, icon: const Icon(Icons.menu) ,),
          title: const Text("AppBar Örnek"),
          centerTitle: true,
          backgroundColor: Colors.blue[300], //arkaplan rengi
        ),
        bottomNavigationBar: BottomNavigationBar(
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
    return _pages[_currentIndex];
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
