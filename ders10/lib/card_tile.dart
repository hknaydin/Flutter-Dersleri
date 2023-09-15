import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ExtansionCardClass(),
    debugShowCheckedModeBanner: false,
  ));
}

class ExtansionCardClass extends StatelessWidget {
  // Apple hakkında bilgi
  String appleHakkinda =
  """  Şirket 1 Nisan 1976 yılında kurulmuş ve 3 Ocak 1977'de Apple Computer, Inc. adıyla anonim şirket haline gelmiştir. ... Apple, Samsung Electronics'den sonra ciro açısından dünyanın en büyük ikinci bilgi teknolojileri şirketi; Samsung ve Nokia'dan sonra da dünyanın en büyük üçüncü cep telefonu üreticisidir.
  """;
  //  Google hakkında bilg
  String googleHakkinda="Google'ın dünya çapında veri merkezlerinde bir milyondan fazla sunucuda çalıştığı, bir milyardan fazla arama isteğini işlediği ve kullanıcıları tarafından oluşturulan verinin gün başına yirmi dört petabayt olduğu tahmin edilmektedir.Kuruluşundan bugüne dek gerçekleşen büyüme hızı, şirketin temel web arama motorunun ötesinde ürünler, satın almalar ve ortaklıklar zincirinin meydana gelmesini sağladı.";
  //  Microsoft hakkında bilgi
  String microsoftHakkinda="Microsoft Corporation, ABD merkezli bir çok uluslu teknoloji şirketidir. Bilgisayar yazılımları, elektronik cihazlar, kişisel bilgisayarlar ve bilişim hizmetleri geliştirir, üretir, lisanslar ve satar. Şirketin en çok bilinen yazılımları Microsoft Windows ve MS-DOS işletim sistemi aileleri, Microsoft Office paketi, Bing adlı arama motoru, Internet Explorer ve Edge web tarayıcılarıdır. Öne çıkan donanım ürünleri ise Xbox video oyun konsolları, Microsoft Hololens sanal gerçeklik gözlükleri ve Microsoft Surface dokunmatik ekranlı kişisel bilgisayar ürün ailesidir.";
  // Facebook hakkında bilgi
  String facebookHakkinda="Facebook, insanların başka insanlarla iletişim kurmasını ve bilgi alışverişi yapmasını amaçlayan bir sosyal ağ. 4 Şubat 2004 tarihinde Harvard Üniversitesi 2006 devresi öğrencisi Mark Zuckerberg tarafından kurulan Facebook, öncelikle Harvard öğrencileri için kurulmuştu. Daha sonra Boston civarındaki okulları da içine alan Facebook, iki ay içerisinde Ivy Ligi okullarının tamamını kapsadı. İlk sene içerisinde de; Amerika Birleşik Devletleri'ndeki tüm okullar Facebook'ta mevcuttu. Üyeler önceleri sadece söz konusu okulun e-posta adresiyle (.edu, .ac.uk, vb.) üye olabiliyordu.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Arka plan rengi
      backgroundColor: Color(0xff4D5B5D),
      // AppBar
      appBar: AppBar(
        // gölgelendirme
        elevation: 0,
        // baştaki Icon
        //Başlık
        title: Text(
          "Expansion Card Kütüphanesi",
          style: TextStyle(
            color: Color(0xff329D9C),
          ),
        ),
        // Arka plan rengi
        backgroundColor: Color(0xff4D5B5D),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    "Abhishek Mishra",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("abhishekm977@gmail.com"),
                  currentAccountPictureSize: Size.square(40),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 1.0, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          // Expansion Card Fonksiyonu
          ExpansionCardFonksiyonu("Apple", "apple", appleHakkinda),
          ExpansionCardFonksiyonu("Facebook", "facebook", facebookHakkinda),
          ExpansionCardFonksiyonu("Google", "google", googleHakkinda),
          ExpansionCardFonksiyonu("Microsoft", "microsoft", microsoftHakkinda),
        ],
      ),
    );
  }
  /**
   * Aldığı parametreler şirketin başlığı logo ve hakkında bilgi
   */
  ExpansionCardFonksiyonu(String title, String logo, String hakkinda) {
    // Karta güzel gözükmesi için her taraftan 20 pixel boşluk verdim.
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ExpansionTileCard(
        // Kart açıldığında hangi renk olacak
        expandedColor: Color(0xff329D9C),
        // Asıl kart açılmadan gözüken renk
        baseColor: Color(0xff4D5B5D),
        // Gölgelendirme oranı
        elevation: 15,
        // Başlangıçta kart açılmadan önce verilen gölgelendirme oranı
        initialElevation: 15,
        // Gölgelendirme rengi
        shadowColor: Colors.black,
        // kartın başlığı
        title: Text(
          "$title",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Kartın alt başlığı
        subtitle: Text(
          "$title Şirketi hakkında bilgi almak için tıklayınız.",
          style: TextStyle(
            color:Color(0xff329D9C),
          ),
        ),
        // İlk başta bulunacak Widget(İstedeiğiniz şeyi ekleyebilirsiniz. Ben resim ekledim.)
        leading: Image.asset(
          "assets/images/$logo.png",
          height: 40,
        ),
        // Sonunda bulunacak Widget
        trailing: Icon(
          Icons.add,
          color: Colors.white,
        ),
        //Açıldığında alt tarafta çıkacak torun Widgetlar
        children: [
          // 10 pixel padding verdim
          Padding(
            padding: const EdgeInsets.all(10.0),
            // Sütun
            child: Column(
              children: [
                // 20 pixel boşluk
                SizedBox(
                  height: 20,
                ),
                // Merkeze bir logo
                Center(
                  child: Image.asset(
                    "assets/images/$logo.png",
                    height: 100,
                  ),
                ),
                // 20 pixel boşluk
                SizedBox(
                  height: 20,
                ),
                // Hakkında bilgi
                Text(
                  "$hakkinda",
                  style: TextStyle(
                    color: Color(0xff4D5B5D),
                  ),
                ),
                // 20 pixel boşluk
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}