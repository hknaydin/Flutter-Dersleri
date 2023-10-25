import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/user/Patient.dart';

class PatientAboutPage extends StatefulWidget {
  final Patient patient;
  final Color selectedBackgroundColor;
  const PatientAboutPage(
      {super.key,
      required this.patient,
      required this.selectedBackgroundColor});

  @override
  State<PatientAboutPage> createState() => PatientAboutPageState(
      patient: patient, selectedBackgroundColor: selectedBackgroundColor);
}

class PatientAboutPageState extends State<PatientAboutPage> {
  final Patient patient;
  final Color selectedBackgroundColor;
  PatientAboutPageState(
      {required this.patient, required this.selectedBackgroundColor});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: selectedBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'hasta_bilgileri'.tr(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 4, bottom: 4),
                              child: Text(
                                'hasta_ad'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_soyad'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_yas'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'cinsiyet'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_kan_grubu'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hipo_glisemi'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hiper_glisemi'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'kilo'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'boy'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_uyruk'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_dogum_yeri'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_dogum_tarihi'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                'hasta_iletisim_bilgileri'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 2,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: selectedBackgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            int selectedValue = 0;

                            return AlertDialog(
                              title: Text("Hipo Değeri Seç"),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Slider(
                                      value: selectedValue.toDouble(),
                                      min: 0,
                                      max: 100,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedValue = newValue.round();
                                        });
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("İptal"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            print(
                                                "Seçilen değer: $selectedValue");
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: selectedBackgroundColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 6, bottom: 6),
                                child: Text(
                                  'hipo_glisemi'.tr(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "12",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            int selectedValue = 0;

                            return AlertDialog(
                              title: Text("Hiper Değeri Seç"),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Slider(
                                      value: selectedValue.toDouble(),
                                      min: 0,
                                      max: 100,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedValue = newValue.round();
                                        });
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("İptal"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            print(
                                                "Seçilen değer: $selectedValue");
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: selectedBackgroundColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 6, bottom: 6),
                                child: Text(
                                  'hiper_glisemi'.tr(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "20",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.blue),
                        ),
                        minimumSize: Size(250.sp, 40),
                      ),
                      child: Text(
                        'degerleri_guncelle'.tr(),
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
            ),
          ),
        ],
      ),
    ));
  }
}
