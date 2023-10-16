import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/model/user/Doctor.dart';

import '../../drawer/patient/patientDrawerPage.dart';
import '../../model/user/Patient.dart';

class PatientInformationView extends StatefulWidget {
  final Doctor doctor;
  final Patient patient;
  const PatientInformationView(
      {super.key, required this.patient, required this.doctor});

  @override
  State<PatientInformationView> createState() =>
      PatientPageForDoctorState(doctor: doctor, patient: patient);
}

class PatientPageForDoctorState extends State<PatientInformationView> {
  late String doctorName = "";
  final Doctor doctor;
  final Patient patient;

  PatientPageForDoctorState({required this.doctor, required this.patient});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      drawer: PatientDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 60,
            color: Color(0xFF00a5ff),
            child: Center(
              child: Text(
                "${'patient_selection'.tr()} ${patient.username}",
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
        ],
      ),
    ));
  }
}
