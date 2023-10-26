import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

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
  late int currentGlobalHipoGlisemi;
  late int currentGlobalHiperGlisemi;

  PatientAboutPageState(
      {required this.patient, required this.selectedBackgroundColor});

  @override
  void initState() {
    super.initState();
    initGlisemiValues();
  }

  void initGlisemiValues() {
    currentGlobalHipoGlisemi = patient.hipo_glisemi;
    currentGlobalHiperGlisemi = patient.hiper_glisemi;
  }

  int calculateAge(String dateOfBirth) {
    List<String> tarihParcalari = dateOfBirth.split('.');
    int gun = int.parse(tarihParcalari[0]);
    int ay = int.parse(tarihParcalari[1]);
    int yil = int.parse(tarihParcalari[2]);

    DateTime dogumTarihiObjesi = DateTime(yil, ay, gun);
    DateTime bugun = DateTime.now();

    int yas = bugun.year - dogumTarihiObjesi.year;

    if (bugun.month < dogumTarihiObjesi.month ||
        (bugun.month == dogumTarihiObjesi.month &&
            bugun.day < dogumTarihiObjesi.day)) {
      yas--;
    }

    return yas;
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
                                "${'hasta_ad'.tr()} ${patient.username}",
                                style: buildTextStyle(),
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
                                "${'hasta_soyad'.tr()} ${patient.userlastname}",
                                style: buildTextStyle(),
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
                                "${'hasta_yas'.tr()} ${calculateAge(patient.data_of_birth)}",
                                style: buildTextStyle(),
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
                                "${'cinsiyet'.tr()} ${patient.gender}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hasta_kan_grubu'.tr()} ${patient.blood_information}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hipo_glisemi'.tr()} ${patient.hipo_glisemi}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hiper_glisemi'.tr()} ${patient.hiper_glisemi}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'kilo'.tr()} ${patient.weight}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'boy'.tr()} ${patient.length}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hasta_uyruk'.tr()} ${patient.nationality}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hasta_dogum_yeri'.tr()} ${patient.place_of_birth}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hasta_dogum_tarihi'.tr()} ${patient.data_of_birth}",
                                style: buildTextStyle(),
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
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 6, bottom: 6),
                              child: Text(
                                "${'hasta_iletisim_bilgileri'.tr()}\n${patient.tel_no}",
                                style: buildTextStyle(),
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
          const SizedBox(height: 5),
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
                    Card(
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
                      child: InkWell(
                        onTap: () {
                          chooseDialogHipoAndHiperGlisemi('hipo_value_set'
                              .tr()); // Tıklama işleminde _showDialog fonksiyonunu çağırır
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 6, bottom: 6),
                                child: Text(
                                  'hipo_glisemi'.tr(),
                                  textAlign: TextAlign.start,
                                  style: buildTextStyleBottomValues(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                currentGlobalHipoGlisemi.toString(),
                                textAlign: TextAlign.center,
                                style: buildTextStyleBottomValues(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
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
                      child: InkWell(
                        onTap: () {
                          chooseDialogHipoAndHiperGlisemi('hiper_value_set'
                              .tr()); // Tıklama işleminde _showDialog fonksiyonunu çağırır
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 6, bottom: 6),
                                child: Text(
                                  'hiper_glisemi'.tr(),
                                  textAlign: TextAlign.start,
                                  style: buildTextStyleBottomValues(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                currentGlobalHiperGlisemi.toString(),
                                textAlign: TextAlign.center,
                                style: buildTextStyleBottomValues(),
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    ));
  }

  TextStyle buildTextStyleBottomValues() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
  }

  void chooseDialogHipoAndHiperGlisemi(String dialogTitle) {
    int currentHipoGlisemi = patient.hipo_glisemi; // Başlangıçta seçili değer
    int currentHiperGlisemi = patient.hiper_glisemi; // Başlangıçta seçili değer

    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(dialogTitle),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return NumberPicker(
                  selectedTextStyle:
                      const TextStyle(color: Colors.red, fontSize: 30),
                  value: dialogTitle == 'hipo_value_set'.tr()
                      ? currentHipoGlisemi
                      : currentHiperGlisemi,
                  minValue: 1,
                  maxValue: 100,
                  onChanged: (value) {
                    setState(() {
                      dialogTitle == 'hipo_value_set'.tr()
                          ? currentHipoGlisemi = value
                          : currentHiperGlisemi = value;
                    }); // to change on widget level state
                    SBsetState(() => dialogTitle == 'hipo_value_set'.tr()
                        ? currentHipoGlisemi = value
                        : currentHiperGlisemi =
                            value); //* to change on dialog state
                  });
            }),
            actions: [
              TextButton(
                child: Text('cancel'.tr()),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // İptal butonuna basıldığında dialog kapatılır
                },
              ),
              TextButton(
                child: Text('set'.tr()),
                onPressed: () {
                  setState(() => dialogTitle == 'hipo_value_set'.tr()
                      ? currentGlobalHipoGlisemi = currentHipoGlisemi
                      : currentGlobalHiperGlisemi = currentHiperGlisemi);
                  Navigator.of(context).pop();
                },
              )
            ],
            actionsAlignment: MainAxisAlignment
                .spaceBetween, // Düğmeleri sağa ve sola hizalar
          );
        });
  }
}
