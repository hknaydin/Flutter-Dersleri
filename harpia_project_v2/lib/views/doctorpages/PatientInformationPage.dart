import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/model/user/Doctor.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';

import '../../drawer/patient/patientDrawerPage.dart';
import '../../model/user/Patient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'PatientAbout.dart';

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

late List<num> _xValues;
late List<num> _yValues;
List<double> _xPointValues = <double>[];
List<double> _yPointValues = <double>[];

class PatientPageForDoctorState extends State<PatientInformationView> {
  late String doctorName = "";
  final Doctor doctor;
  final Patient patient;
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  PatientPageForDoctorState({required this.doctor, required this.patient});
  Color _selectedColor = Colors.blue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
    loadBackgroundColor();
    getPatientData(patient.id);
  }

  void getPatientData(patient_id) {}

  void toggleDrawer() {
    if (isDrawerOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
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
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: selectedBackgroundColor,
        drawer: PatientDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 1),
            // Birinci Satır
            Padding(
              padding: const EdgeInsets.all(2.0),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onPressed: toggleDrawer,
                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
                          // Butonun tıklanınca rengi
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: null,
                        child: Text('100 mg/dl',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: buildTextStyleHourAndMinuteValue(
                                FontWeight.normal, 12)),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'measurement'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              'periyod'.tr(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '11:11',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          // İkinci butona tıklama işlemi
                        },
                        child: Text(
                            maxLines: 2,
                            'getir'.tr(),
                            overflow: TextOverflow.ellipsis,
                            style: buildTextStyleHourAndMinuteValue(
                                FontWeight.normal, 12)),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            SizedBox(height: 1.h),
            // İkinci Satır
            buildHourAndMinutePanel(context),
            // Üçüncü Satır (Grafik Çizimi)
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 1.0, right: 1.0, top: 4.0, bottom: 2.0),
                child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: selectedBackgroundColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: buildSfCartesianChart()),
              ),
            ),
            // Dördüncü Satır
            Padding(
              padding: const EdgeInsets.all(1.0),
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
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          // Üçüncü Kolon
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientAboutPage(
                                        patient: patient,
                                        selectedBackgroundColor:
                                            selectedBackgroundColor,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: Size(150, 40),
                          ),
                          child: Text(
                            'hasta_bilgisi'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Hasta bilgisi butonuna tıklama işlemi
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: Size(150, 40),
                          ),
                          child: Text(
                            'pdf_cikti'.tr(),
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
                    // İkinci Kolon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Hasta bilgisi butonuna tıklama işlemi
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: Size(250.w, 40),
                          ),
                          child: Text(
                            "${'patient_information'.tr()} ${patient.username} ${patient.userlastname}",
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
                    // Üçüncü Kolon
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SfCartesianChart buildSfCartesianChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.white,
      title: ChartTitle(text: 'Capital investment as a share of exports'),
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.yMMM(),
        intervalType: DateTimeIntervalType.months,
        interval: 3,
      ),
    );
  }

  buildHourAndMinutePanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: selectedBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 0,
                color: selectedBackgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text('set_hour'.tr(),
                          style: buildTextStyleHourAndMinuteValue(
                              FontWeight.normal, 15)),
                      SizedBox(width: 20),
                      Text(
                        "1",
                        style: buildTextStyleHourAndMinuteValue(
                            FontWeight.bold, 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Card(
                elevation: 0,
                color: selectedBackgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text('set_minute'.tr(),
                          style: buildTextStyleHourAndMinuteValue(
                              FontWeight.normal, 15)),
                      SizedBox(width: 20),
                      Text(
                        "02",
                        style: buildTextStyleHourAndMinuteValue(
                            FontWeight.bold, 15),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyleHourAndMinuteValue(
      FontWeight fontWeight, double fontSize) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
