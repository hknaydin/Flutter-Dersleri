import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/model/user/Doctor.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';

import '../../drawer/patient/patientDrawerPage.dart';
import '../../model/user/Patient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientInformationView extends StatefulWidget {
  final Doctor doctor;
  final Patient patient;
  const PatientInformationView(
      {Key? key, required this.patient, required this.doctor})
      : super(key: key);

  @override
  State<PatientInformationView> createState() =>
      PatientPageForDoctorState(doctor: doctor, patient: patient);
}

class PatientPageForDoctorState extends State<PatientInformationView> {
  late String doctorName = "";
  final Doctor doctor;
  final Patient patient;
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  PatientPageForDoctorState({required this.doctor, required this.patient});
  Color _selectedColor = Colors.blue;
  @override
  void initState() {
    super.initState();
    loadBackgroundColor();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.resumed) {
        loadBackgroundColor();
      }
    });
  }

  void loadBackgroundColor() async {
    int colorValue = await MySharedPreferences.getBackgroundColor();
    setState(() {
      selectedBackgroundColor = Color(colorValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedBackgroundColor,
      drawer: PatientDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Birinci Satır
          Expanded(
            flex: 1,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.menu_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Birinci butona tıklama işlemi
                      // Saat seçimi dialog açılabilir
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            4.0), // Kare şeklinde buton için 0 değeri kullanılır
                      ),
                    ),
                    child: Text('Button 1'),
                  ),
                  SizedBox(width: 20),
                  Text('Text Widget'),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // İkinci butona tıklama işlemi
                      // Dakika ayarı dialog açılabilir
                    },
                    child: Text('Button 2'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          SizedBox(height: 1.h),
          // İkinci Satır
          Expanded(
            flex: 1,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // İkinci satırdaki birinci butona tıklama işlemi
                    },
                    child: Text('Button 3'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // İkinci satırdaki ikinci butona tıklama işlemi
                    },
                    child: Text('Button 4'),
                  ),
                ],
              ),
            ),
          ),
          // Üçüncü Satır (Grafik Çizimi)
          Expanded(
            flex: 6,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                // Birinci Kolon
                SegmentedButton<Color>(
                  selected: <Color>{_selectedColor},
                  onSelectionChanged: (Set<Color> newSelection) {
                    setState(() {
                      _selectedColor = newSelection.first;
                    });
                  },
                  segments: const <ButtonSegment<Color>>[
                    ButtonSegment<Color>(
                      value: Colors.red,
                      label: Text('Red'),
                    ),
                    ButtonSegment<Color>(
                      value: Colors.green,
                      label: Text('Green'),
                    ),
                    ButtonSegment<Color>(
                      value: Colors.yellow,
                      label: Text('Yellow'),
                    ),
                  ],
                ),
                // İkinci Kolon
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      // İkinci sütun içeriği
                    ],
                  ),
                ),
                // Üçüncü Kolon
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      // Üçüncü sütun içeriği
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Dördüncü Satır
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                // Birinci Kolon
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      // İlk sütun içeriği
                    ],
                  ),
                ),
                // İkinci Kolon
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      // İkinci sütun içeriği
                    ],
                  ),
                ),
                // Üçüncü Kolon
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      // Üçüncü sütun içeriği
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
