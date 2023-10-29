import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/Utils.dart';

class DoctorSharePage extends StatefulWidget {
  const DoctorSharePage({Key? key}) : super(key: key);

  @override
  DoctorSharePageState createState() => DoctorSharePageState();
}

class DoctorSharePageState extends State<DoctorSharePage> {
  late Image _image;
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  // Create an instance of ScreenshotController
  static GlobalKey previewContainer = GlobalKey();
  @override
  void initState() {
    super.initState();
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
    return RepaintBoundary(
      key: previewContainer,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: selectedBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/ic_dikey_1.svg',
                          width: double.infinity,
                          height: 500,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: const Size(300, 40),
                          ),
                          child: Text(
                            'share'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
