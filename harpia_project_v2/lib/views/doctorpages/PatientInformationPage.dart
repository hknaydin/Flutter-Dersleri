import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/model/patientGlikoz/PatientGlikozValues.dart';
import 'package:harpia_project/model/user/Doctor.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vibration/vibration.dart';

import '../../drawer/patient/patientDrawerPage.dart';
import '../../model/user/Patient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../network/HttpRequestPatient.dart';
import '../../result/dataResult.dart';
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

class PatientPageForDoctorState extends State<PatientInformationView> {
  late TrackballBehavior _trackballBehavior;
  late String doctorName = "";
  final Doctor doctor;
  final Patient patient;
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  PatientPageForDoctorState({required this.doctor, required this.patient});
  Color _selectedColor = Colors.blue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;
  TooltipBehavior? _tooltipBehavior;
  late int patientGlobalHourPeriod = 0;
  late int patientGlobalMinutePeriod = 0;
  late String patientMeasurePeriod = "";
  late Patient _pt;
  late List<PatientGlikozValues> patientGlikozValues =
      []; // Hasta bilgilerini tutmak için bir liste

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    _pt = patient;
    loadBackgroundColor();
    getPatientData(_pt.id);
    setPatientMeasurePeriod();
  }

  Future<void> getPatientData(int patientId) async {
    var request = PatientApi();

    List<PatientGlikozValues> _patientGlikozValues =
        await request.getPatientGlikozValues(patientId);

    print(_patientGlikozValues);

    setState(() {
      patientGlikozValues = _patientGlikozValues; // Hastaları güncelle
    });
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
        drawer: const PatientDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 1),
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
                    const SizedBox(width: 4),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
                          // Butonun tıklanınca rengi
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
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
                    const SizedBox(width: 10),
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
                              patientMeasurePeriod,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          setPatientSensorPeriod(
                              _pt.id,
                              patientGlobalHourPeriod,
                              patientGlobalMinutePeriod);
                        },
                        child: Text(
                            maxLines: 2,
                            'getir'.tr(),
                            overflow: TextOverflow.ellipsis,
                            style: buildTextStyleHourAndMinuteValue(
                                FontWeight.normal, 12)),
                      ),
                    ),
                    const SizedBox(width: 10),
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
                    const SizedBox(
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
                            segments: <ButtonSegment<Color>>[
                              ButtonSegment<Color>(
                                value: Colors.red,
                                label: Text('daily'.tr()),
                              ),
                              ButtonSegment<Color>(
                                value: Colors.green,
                                label: Text('weekly'.tr()),
                              ),
                              ButtonSegment<Color>(
                                value: Colors.yellow,
                                label: Text('monthly'.tr()),
                              ),
                            ],
                          ),
                          // İkinci Kolon
                          // Üçüncü Kolon
                        ],
                      ),
                    ),
                    const SizedBox(
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
                                        patient: _pt,
                                        selectedBackgroundColor:
                                            selectedBackgroundColor,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: const BorderSide(color: Colors.blue),
                            ),
                            minimumSize: const Size(150, 40),
                          ),
                          child: Text(
                            'hasta_bilgisi'.tr(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Hasta bilgisi butonuna tıklama işlemi
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: const BorderSide(color: Colors.blue),
                            ),
                            minimumSize: const Size(150, 40),
                          ),
                          child: Text(
                            'pdf_cikti'.tr(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: Size(250.w, 40),
                          ),
                          child: Text(
                            "${'patient_information'.tr()} ${_pt.username} ${_pt.userlastname}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
      plotAreaBorderWidth: 2,
      backgroundColor: Colors.white,
      trackballBehavior: _trackballBehavior,
      title: ChartTitle(text: 'Capital investment as a share of exports'),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true), // Enables the tooltip.
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true, // Enable panning (dragging) of the chart.
        enablePinching: true, // Enable pinching (zooming) of the chart.
        enableDoubleTapZooming: true, // Enable double-tap zooming of the chart.
        enableSelectionZooming: true,
        enableMouseWheelZooming: true, // Enable selection zooming of the chart.
      ),
      // Enables the legend.
      series: <ChartSeries>[
        LineSeries<PatientGlikozValues, String>(
            markerSettings: MarkerSettings(isVisible: true),
            dataSource: patientGlikozValues,
            xValueMapper: (PatientGlikozValues glikoz, _) =>
                glikoz.login_time.toString(),
            yValueMapper: (PatientGlikozValues glikoz, _) =>
                int.parse(glikoz.glikoz_value),
            dataLabelSettings:
                DataLabelSettings(isVisible: true) // Enables the data label.
            ),
      ],
    );
  }

  Widget buildHourAndMinutePanel(BuildContext context) {
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
              Expanded(
                child: InkWell(
                  onTap: () {
                    Vibration.vibrate(
                        pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500]);
                    numberPickerDialogHour('set_hour'.tr());
                  },
                  child: Card(
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
                          const SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              patientGlobalHourPeriod.toString(),
                              style: buildTextStyleHourAndMinuteValue(
                                  FontWeight.bold, 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () {
                    numberPickerDialogHour('set_minute'.tr());
                  },
                  child: Card(
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
                          Expanded(
                            child: Text(
                              patientGlobalMinutePeriod.toString(),
                              style: buildTextStyleHourAndMinuteValue(
                                  FontWeight.bold, 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
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

  String setMeasuringPeriod(String ptSensorPeriod) {
    int totalSeconds = int.parse(ptSensorPeriod);
    int minutes = totalSeconds ~/ 60;
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String date =
        '${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}';
    setState(() {
      patientGlobalHourPeriod = hours;
      patientGlobalMinutePeriod = remainingMinutes;
    });
    return date;
  }

  void numberPickerDialogHour(String dialogTitle) {
    int currentHourPeriod = patientGlobalHourPeriod;
    int currentMinutePeriod = patientGlobalMinutePeriod;

    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(dialogTitle, textAlign: TextAlign.center),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return NumberPicker(
                  textStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  selectedTextStyle:
                      const TextStyle(color: Colors.red, fontSize: 40),
                  value: dialogTitle == 'set_hour'.tr()
                      ? currentHourPeriod
                      : currentMinutePeriod,
                  minValue: 0,
                  maxValue: dialogTitle == 'set_hour'.tr() ? 23 : 59,
                  onChanged: (value) {
                    setState(() {
                      dialogTitle == 'set_hour'.tr()
                          ? currentHourPeriod = value
                          : currentMinutePeriod = value;
                    }); // to change on widget level state
                    SBsetState(() => dialogTitle == 'set_hour'.tr()
                        ? currentHourPeriod = value
                        : currentMinutePeriod =
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
                  setState(() => dialogTitle == 'set_hour'.tr()
                      ? patientGlobalHourPeriod = currentHourPeriod
                      : patientGlobalMinutePeriod = currentMinutePeriod);
                  Navigator.of(context).pop();
                },
              )
            ],
            actionsAlignment: MainAxisAlignment
                .spaceBetween, // Düğmeleri sağa ve sola hizalar
          );
        });
  }

  void setPatientMeasurePeriod() {
    int totalSeconds = int.parse(_pt.sensor_period);
    int minutes = totalSeconds ~/ 60;
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String date =
        '${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}';
    setState(() {
      patientGlobalHourPeriod = hours;
      patientGlobalMinutePeriod = remainingMinutes;
      patientMeasurePeriod = date;
    });
  }

  void setPatientSensorPeriod(int patientId, int patientGlobalHourPeriod,
      int patientGlobalMinutePeriod) {
    var request = PatientApi();

    int totalSeconds =
        patientGlobalHourPeriod * 3600 + patientGlobalMinutePeriod * 60;

    request
        .setPatientSensorPeriod(patientId, totalSeconds)
        .then((response) async {
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      var data = DataResult.fromJson(jsonData);
      if (data.success) {
        var extractedData = data.data;
        Patient pt = Patient.fromJson(extractedData);
        setPatientMeasurePeriod();
        setState(() {
          _pt = pt;
        });
      }
    });
  }
}
