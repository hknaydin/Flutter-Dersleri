import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/MySharedPreferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../utils/Utils.dart';

class DoctorAboutDevice extends StatefulWidget {
  const DoctorAboutDevice({super.key});

  @override
  DoctorAboutDeviceState createState() => DoctorAboutDeviceState();
}

class DoctorAboutDeviceState extends State<DoctorAboutDevice> {
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String deviceName = "Bilinmiyor";
  String brand = "Bilinmiyor";
  String model = "Bilinmiyor";
  String isBluetooth = "NO";
  String resolutionDip = "empty";
  @override
  initState() {
    super.initState();
    _loadBackgroundColor();
    getDeviceInformation();
    checkBluetoothAvailability();
    findDensity();
  }

  Future checkBluetoothAvailability() async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    bool isBluetoothAvailable = await flutterBlue.isOn;

    if (isBluetoothAvailable) {
      setState(() {
        isBluetooth = 'YES';
      });
    } else {
      setState(() {
        isBluetooth = 'NO';
      });
    }
  }

  Future<void> _loadBackgroundColor() async {
    Color colorValue = await utilLoadBackgroundColor();
    setState(() {
      selectedBackgroundColor = colorValue;
    });
  }

  void getDeviceInformation() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  void findDensity() async {
    switch (MediaQuery.of(context).devicePixelRatio.toInt()) {
      case 120:
        resolutionDip = 'ldpi';
        break;
      case 160:
        resolutionDip = 'mdpi';
        break;
      case 240:
        resolutionDip = 'hdpi';
        break;
      case 320:
        resolutionDip = 'xhdpi';
        break;
      case 480:
        resolutionDip = 'xxhdpi';
        break;
      case 640:
        resolutionDip = 'xxxhdpi';
        break;
      default:
        resolutionDip = 'unknown';
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.version,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    int screenWidth = MediaQuery.of(context).size.width.toInt();
    int screenHeight = MediaQuery.of(context).size.height.toInt();
    double screenDensity = MediaQuery.of(context).devicePixelRatio;

    int resolutionWidth = (screenWidth * screenDensity).toInt();
    int resolutionHeight = (screenHeight * screenDensity).toInt();

    return SafeArea(
      child: Scaffold(
        backgroundColor: selectedBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'about_device'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 4,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'hardware'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'device_name'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'android_version'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'manufacturer'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'model'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'brand'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Platform.isAndroid
                                  ? _deviceData['model']
                                  : Platform.isIOS
                                      ? _deviceData['device']
                                      : deviceName, // Buraya ilgili verileri ekleyin
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              Platform.isAndroid
                                  ? _deviceData['version.release'].toString()
                                  : Platform.isIOS
                                      ? _deviceData['utsname.release:']
                                          .toString()
                                      : deviceName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              Platform.isAndroid
                                  ? _deviceData['manufacturer']
                                  : Platform.isIOS
                                      ? _deviceData['identifierForVendor']
                                          .toString()
                                      : deviceName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              Platform.isAndroid
                                  ? _deviceData['model']
                                  : Platform.isIOS
                                      ? _deviceData['device']
                                      : deviceName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              Platform.isAndroid
                                  ? _deviceData['brand']
                                  : Platform.isIOS
                                      ? _deviceData['device']
                                      : deviceName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: Color(0x80D1D1D1),
                  margin: EdgeInsets.only(top: 12),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'bluetooth_smart'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'bluetooth_smart_supported'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'advertiser_mode_supported'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              isBluetooth, // Bu değerleri ilgili olanlarla güncelleyin
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'YES',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: Color(0x80D1D1D1),
                  margin: EdgeInsets.only(top: 12),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'screen'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'resolution'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'dimension_px'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'dimension_dip'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'size'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              resolutionDip, // Bu değerleri ilgili olanlarla güncelleyin
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "$resolutionWidth x $resolutionHeight",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "$screenWidth x $screenHeight",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Normal',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
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
    );
  }
}
