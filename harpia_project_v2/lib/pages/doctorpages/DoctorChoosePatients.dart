import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/model/user/Doctor.dart';

import '../../model/user/Patient.dart';
import '../../network/HttpRequestDoctor.dart';
import 'PatientInformationPage.dart';

class ListviewBuilderPatient extends StatefulWidget {
  final Doctor doctor;

  const ListviewBuilderPatient({super.key, required this.doctor});

  @override
  State<ListviewBuilderPatient> createState() =>
      ListviewBuilderPatientState(doctor: doctor);
}

class ListviewBuilderPatientState extends State<ListviewBuilderPatient>
    with SingleTickerProviderStateMixin {
  late String doctorName = "";
  final Doctor doctor;
  late List<Patient> patients = []; // Hasta bilgilerini tutmak için bir liste
  late AnimationController animationController;
  late Animation<double> animation;

  ListviewBuilderPatientState({required this.doctor});

  @override
  void initState() {
    super.initState();
    fetchPatients(doctor);
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
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
            color: Color(0xFF00a5ff),
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
            height: 50,
            color: Color(0xFF00a5ff),
            child: Center(
              child: Text(
                "${'doctor_name'.tr()} ${doctor.username} ${doctor.userlastname}",
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
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                Patient patient = patients[index];
                IconData genderIcon =
                    patient.gender == "male" ? Icons.male : Icons.female;

                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    leading: Icon(genderIcon),
                    title: Text("${patient.username} ${patient.userlastname}"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientInformationView(
                                patient: patient, doctor: doctor)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  startAnimation(); // Animasyonu başlat
                  fetchPatients(doctor); // Hasta listesini güncelle
                },
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: animation.value,
                      child: Transform.rotate(
                        angle:
                            animationController.value * 2 * 3.141592653589793,
                        child: Icon(Icons.refresh, color: Colors.white),
                      ),
                    );
                  },
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Colors.blue, // İstediğiniz rengi ayarlayabilirsiniz
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> fetchPatients(Doctor doctor) async {
    // Burada backend tarafından hasta bilgilerini çekme işlemini gerçekleştirirsiniz
    // Örnek olarak, sabit bir liste kullanalım
    var request = DoctorApi();
    List<Patient> patientsFromDoctor =
        await request.getPatientListForDoctor(doctor.usermail);

    print(patientsFromDoctor);

    setState(() {
      patients = patientsFromDoctor; // Hastaları güncelle
    });
  }

  void startAnimation() {
    animationController.reset();
    animationController.forward();
  }
}
