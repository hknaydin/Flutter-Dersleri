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
  }

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
            // Birinci Satır
            Expanded(
              flex: 1,
              child: Card(
                elevation: 0,
                color: selectedBackgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onPressed: toggleDrawer,
                      ),
                    ),
                    SizedBox(width: 5),
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
                        child: Text(
                          '100 mg/dl',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                              '11:11:11',
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
                          maxLines: 1,
                          'getir'.tr(),
                          overflow: TextOverflow.ellipsis,
                        ),
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
              flex: 5,
              child: Container(
                child: buildSfCartesianChart(),
              ),
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
      ),
    );
  }

  SfCartesianChart buildSfCartesianChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Capital investment as a share of exports'),
      primaryXAxis: DateTimeAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        dateFormat: DateFormat.yMMM(),
        intervalType: DateTimeIntervalType.months,
        interval: 3,
      ),
    );
  }

  Expanded buildHourAndMinutePanel(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 0,
        color: selectedBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
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
                            FontWeight.normal, 20)),
                    SizedBox(width: 20),
                    Text(
                      "1",
                      style:
                          buildTextStyleHourAndMinuteValue(FontWeight.bold, 20),
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
                            FontWeight.normal, 20)),
                    SizedBox(width: 20),
                    Text(
                      "02",
                      style:
                          buildTextStyleHourAndMinuteValue(FontWeight.bold, 20),
                    ),
                  ],
                ),
              ),
            )
          ],
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
