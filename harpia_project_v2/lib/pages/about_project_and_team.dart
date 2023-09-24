import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

final List<String> imageList = [
  'assets/images/ic_dikey.svg',
  'assets/images/ic_dikey.svg',
  'assets/images/ic_dikey.svg',
  'assets/images/ic_dikey.svg',
  'assets/images/ic_dikey.svg',
];
final rnd = math.Random();
final List<Color> circleColors = [Colors.red, Colors.blue, Colors.green];

class About extends StatefulWidget {
  const About({super.key});

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 25,
                  right: 0,
                  bottom: 0,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    height: 150.sp,
                    autoPlayInterval: const Duration(seconds: 2),
                  ),
                  items: imageList.map(
                    (e) {
                      Color getRandomColor() => Color(rnd.nextInt(0xffffffff));
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            SvgPicture.asset(
                              e,
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                              color: circleColors[Random().nextInt(2)],
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 1.sp,
                child: Container(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OurProjectTeam(size: size),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'UX Design',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'view_all'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CardField_person(
                  size,
                  Colors.blue,
                  const Icon(
                    Icons.person_2,
                    color: Colors.white,
                  ),
                  'UX Design - Android Design',
                  'Hakan Aydın',
                  "",
                  "",
                  context),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'announcement'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'view_all'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CardField_menu(
                  size,
                  Colors.blue,
                  const Icon(
                    Icons.person_2,
                    color: Colors.white,
                  ),
                  'UX Design - Android Design',
                  'Hakan Aydın',
                  "",
                  "",
                  context),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'categories'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CardField_categories(
                  size,
                  Colors.blue,
                  const Icon(
                    Icons.person_2,
                    color: Colors.white,
                  ),
                  'UX Design - Android Design',
                  'Hakan Aydın',
                  "",
                  "",
                  context),
              //Alt2(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class OurProjectTeam extends StatefulWidget {
  const OurProjectTeam({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _OurProjectTeamState createState() => _OurProjectTeamState();
}

class _OurProjectTeamState extends State<OurProjectTeam> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 5),
            child: Text(
              "our_project_name"
                  .tr(), // Yerelleştirme işlevini kullanmak için gerekli düzenlemeleri yapmanız gerekmektedir.
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 150.sp, // Yüksekliği isteğe bağlı olarak ayarlayabilirsiniz
            width: 300.sp,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardField(
                    Size(300, 100),
                    Colors.blue,
                    const Icon(
                      Icons.person_2,
                      color: Colors.white,
                    ),
                    'project_leader'.tr(),
                    'Bulut Akay',
                    '  Ankara',
                    "  2022-10-10",
                    context),
                CardField(
                    widget.size,
                    Colors.amber,
                    const Icon(Icons.person_2, color: Colors.white),
                    'project_researcher'.tr(),
                    'Hakan AYDIN',
                    '  Trabzon',
                    "  2022-10-10",
                    context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Alt2 extends StatelessWidget {
  const Alt2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "UX Design",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Row(
            children: [
              CardField(
                  size,
                  Colors.blue,
                  Icon(
                    Icons.camera_outlined,
                    color: Colors.white,
                  ),
                  'Cameras',
                  '8 Devices',
                  "",
                  "",
                  context),
              CardField(
                  size,
                  Colors.amber,
                  Icon(Icons.lightbulb_outline, color: Colors.white),
                  'Lights',
                  '8 Devices',
                  "",
                  "",
                  context),
            ],
          ),
        ],
      ),
    );
  }
}

CardField(Size size, Color color, Icon icon, String title, String subtitle,
    String city, String dataOfStart, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
          height: 200.sp,
          width: 200.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: icon,
                ),
                contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              ),
              Divider(
                color: Colors.grey, // Yatay çizgi rengi
                thickness: 1, // Yatay çizgi kalınlığı
                height: 0, // Yatay çizgi yüksekliği
              ),
              ListTile(
                subtitle: Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    Text(
                      '$city',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    Text(
                      '$dataOfStart',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              ),
            ],
          )),
    ),
  );
}

CardField_person(Size size, Color color, Icon icon, String title,
    String subtitle, String city, String dataOfStart, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
          height: 100.sp,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: icon,
                ),
                contentPadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              ),
            ],
          )),
    ),
  );
}

CardField_menu(Size size, Color color, Icon icon, String title, String subtitle,
    String city, String dateOfStart, BuildContext context) {
  // Bugünün tarihini almak için DateTime.now() kullanıyoruz
  String currentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 200.sp,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
              child: Text(
                "read".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                "diabet".tr(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                currentDate,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

CardField_categories(Size size, Color color, Icon icon, String title,
    String subtitle, String city, String dateOfStart, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 150.sp,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem(icon, "project".tr()),
                _buildCategoryItem(icon, "SSKM"),
                _buildCategoryItem(icon, "KRS"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem(icon, "SPP"),
                _buildCategoryItem(icon, "Library"),
                _buildCategoryItem(icon, "Event"),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCategoryItem(Icon icon, String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor:
            Colors.grey, // İstediğiniz resmi buraya ekleyebilirsiniz
        radius: 24,
      ),
      SizedBox(height: 4),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ],
  );
}
