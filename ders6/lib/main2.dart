import 'package:flutter/material.dart';
void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("AppBar Örnek"),
            centerTitle: true,//yazı ortalandı
            toolbarHeight: 75, //appbar yüksekliği
            toolbarOpacity: 1, //appbar şeffaflığı
            shape: const RoundedRectangleBorder( //ovalleştirdi
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
            elevation: 10, //gölge effekti
            backgroundColor: Colors.purple[200], //arkaplan rengi
          ),
        ),
        debugShowCheckedModeBanner: false, //banner kaldırıldı
      )
  );
}