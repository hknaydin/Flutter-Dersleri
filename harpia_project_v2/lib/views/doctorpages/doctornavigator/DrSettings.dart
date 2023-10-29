import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../utils/Utils.dart';

class DoctorSetting extends StatefulWidget {
  const DoctorSetting({super.key});

  @override
  DoctorSettingState createState() => DoctorSettingState();
}

class DoctorSettingState extends State<DoctorSetting> {
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    initPackageInfo();
    _loadBackgroundColor();
  }

  Future<void> _loadBackgroundColor() async {
    Color colorValue = await utilLoadBackgroundColor();
    setState(() {
      selectedBackgroundColor = colorValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: selectedBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('background_color'.tr()),
                onTap: () {
                  showColorPickerDialog(context);
                },
              ),
              Divider(),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text(
                    'about'.tr(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold, // Metin kalınlığı
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('version'.tr()),
                subtitle: Text('display_application_version'.tr()),
                onTap: () {
                  showVersionDialog(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('feedback'.tr()),
                subtitle: Text('send_feedback_to_developers'.tr()),
                onTap: () {
                  // Geri bildirim gönderme işlemini başlat
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void showColorPickerDialog(BuildContext context) {
    Color selectedColor = selectedBackgroundColor;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('choose_background_color'.tr()),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                selectedColor = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Set Color'),
              onPressed: () {
                setState(() {
                  selectedBackgroundColor = selectedColor;
                  MySharedPreferences.setBackgroundColor(
                      selectedBackgroundColor);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showVersionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('app_version'.tr()),
          content: Text("${'version'.tr()}: ${_packageInfo.version}"),
          actions: <Widget>[
            ElevatedButton(
              child: Text('ok'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
