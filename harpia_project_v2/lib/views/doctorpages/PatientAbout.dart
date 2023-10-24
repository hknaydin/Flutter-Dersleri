import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/user/Patient.dart';

class PatientAboutPage extends StatefulWidget {
  final Patient patient;

  const PatientAboutPage({super.key, required this.patient});

  @override
  State<PatientAboutPage> createState() =>
      PatientAboutPageState(patient: patient);
}

class PatientAboutPageState extends State<PatientAboutPage> {
  final Patient patient;

  PatientAboutPageState({required this.patient});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
        ],
      ),
    ));
  }
}
