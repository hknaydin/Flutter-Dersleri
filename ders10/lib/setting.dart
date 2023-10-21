import 'package:flutter/material.dart';

void main() {
  runApp(DoctorSetting());
}

class DoctorSetting extends StatefulWidget {
  const DoctorSetting({super.key});

  @override
  DoctorSettingState createState() => DoctorSettingState();
}

class DoctorSettingState extends State<DoctorSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.settings_input_svideo_sharp,
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            'Some Text',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 30),
          Divider(
            height: 2,
            thickness: 2,
          ),
          SizedBox(height: 20),
          Text(
            'Sürüm',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Uygulama sürümünü gösterir',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/another_image.png',
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Column(
            children: <Widget>[
              Text(
                'Üstteki Text',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                'Altındaki Text',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
