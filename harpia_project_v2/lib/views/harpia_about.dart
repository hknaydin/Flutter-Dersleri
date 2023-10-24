import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/MySharedPreferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';

class HarpiaAbout extends StatefulWidget {
  const HarpiaAbout({super.key});

  @override
  DoctorAboutDeviceState createState() => DoctorAboutDeviceState();
}

class DoctorAboutDeviceState extends State<HarpiaAbout> {
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  Color cardColorTerms = Colors.green; // Şartlar kartının rengi
  Color cardColorPolicy = Colors.white; // Politika kartının rengi
  String currentFile = 'file_tr_terms.html';
  String aboutDeviceText = 'about_device'.tr();
  late final WebViewController _controller;

  @override
  initState() {
    super.initState();
    loadBackgroundColor();
  }

  void loadBackgroundColor() async {
    int colorValue = await MySharedPreferences.getBackgroundColor();
    Locale currentLocale = Localizations.localeOf(context);

    String? languageCode = currentLocale.languageCode;
    setState(() {
      selectedBackgroundColor = Color(colorValue);
      currentFile = 'file_${languageCode}_terms.html';
      aboutDeviceText = 'terms_conditions'.tr();
    });
  }

  void changeView(String newFile, String aboutText) {
    setState(() {
      currentFile = newFile;
      aboutDeviceText = aboutText;
    });
    loadHtmlFromAssets('assets/$newFile', _controller);
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    String? languageCode = currentLocale.languageCode;

    String termsFileName = 'file_${languageCode}_terms.html';
    String policyFileName = 'file_${languageCode}_policy.html';

    return SafeArea(
      child: Scaffold(
        backgroundColor: selectedBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    aboutDeviceText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
              child: Container(
                height: 4,
                color: Colors.black,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center-align vertically
                    children: [
                      InkWell(
                        onTap: () {
                          changeView(termsFileName, 'terms_conditions'.tr());
                        },
                        child: Card(
                          color: (currentFile == termsFileName)
                              ? Colors.green
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10, bottom: 10),
                            child: Text(
                              tr('terms'), // Buraya "Şartlar" metni gelecek
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign
                                  .center, // Center-align text horizontally
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      InkWell(
                        onTap: () {
                          changeView(policyFileName, 'privacy_policy'.tr());
                        },
                        child: Card(
                          color: (currentFile == policyFileName)
                              ? Colors.green
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10, bottom: 10),
                            child: Text(
                              tr('policy'), // Buraya "Politika" metni gelecek
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign
                                  .center, // Center-align text horizontally
                            ),
                          ),
                        ),
                      ),
                      // Buraya şartlar metni eklenebilir
                    ],
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                  child: SizedBox(
                    height: 610,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: '',
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated:
                          (WebViewController webViewController) async {
                        _controller = webViewController;
                        await loadHtmlFromAssets(
                            'assets/${currentFile}', _controller);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
