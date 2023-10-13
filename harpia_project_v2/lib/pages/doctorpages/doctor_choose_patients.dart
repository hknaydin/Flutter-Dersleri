import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorChoosePatient extends StatefulWidget {
  const DoctorChoosePatient({super.key});

  @override
  State<DoctorChoosePatient> createState() => DoctorChoosePatientState();
}

class DoctorChoosePatientState extends State<DoctorChoosePatient> {
  late String doctorName = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 45,
            color: Color(0xFF009688),
            child: Center(
              child: Text(
                'patient_selection'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          Container(
            height: 45,
            color: Color(0xFF009688),
            margin: EdgeInsets.only(top: 47),
            child: Center(
              child: Text(
                'doctor_name'.tr(),
                style: TextStyle(
                  color: Colors.white,
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
