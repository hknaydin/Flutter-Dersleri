import 'package:flutter/material.dart';

void main() => runApp(Uygulamam());

class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UygulamamState();
  }
}

class _UygulamamState extends State {
  TextEditingController _controller = TextEditingController();
  String _yeniYazi="Hadi Birşeyler Yaz";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TextField Uygulaması"),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 100, right: 100),
          width: double.maxFinite,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_yeniYazi,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),


                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    //bordür verdim
                    contentPadding: EdgeInsets.all(20),
                    //içerisindeki yazının etrafına 20 boşluk verdim
                    hintText: "Yazını Bekliyorum",
                    //içerisine varsayılan yazı yazdım
                    hintStyle: TextStyle(color: Colors.white),
                    //varsayılan yazının stilini değiştirdim
                    filled: true,
                    //içerisini renkle doldurayım mı? evet dedim
                    fillColor: Colors.deepPurple),
                //içerisini mor renk yaptım
                autofocus: true,
                //açılınca drekt içerisine odaklansın istedim
                cursorColor: Colors.black12,
                //içerisinde yanıp sönen cursorü siyah yaptım

              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  _yeniYazi=_controller.text;
                });

              }, child: const Text("Değiştir"))
            ],
          ),
        ),
      ),
    );
  }
}
