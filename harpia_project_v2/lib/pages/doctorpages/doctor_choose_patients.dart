import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/model/user/Doctor.dart';

import '../../model/user/Patient.dart';
import '../../network/HttpRequestDoctor.dart';

class DoctorChoosePatient extends StatefulWidget {
  final Doctor doctor;

  const DoctorChoosePatient({super.key, required this.doctor});

  @override
  State<DoctorChoosePatient> createState() =>
      DoctorChoosePatientState(doctor: doctor);
}

class DoctorChoosePatientState extends State<DoctorChoosePatient> {
  late String doctorName = "";
  final Doctor doctor;
  late List<Patient> patients = []; // Hasta bilgilerini tutmak için bir liste

  DoctorChoosePatientState({required this.doctor});
  @override
  void initState() {
    super.initState();
    fetchPatients(doctor);
    // Kullanmak istediğiniz doktor nesnesi burada mevcut olacak
    print(
        'Doctor Name: ${doctor.username}'); // Hasta bilgilerini çeken fonksiyonu çağır
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
            height: 50,
            color: Color(0xFF009688),
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
                // Her bir hasta için bir ListTile oluştur
                Patient patient = patients[index];
                IconData genderIcon =
                    patient.gender == "male" ? Icons.male : Icons.female;

                return ListTile(
                  leading: Icon(genderIcon),
                  title: Text("${patient.username} ${patient.userlastname}"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Hasta detay sayfasına yönlendirme işlemlerini burada gerçekleştirin
                  },
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
                  fetchPatients(doctor);
                },
                child: Icon(Icons.refresh),
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
    var responseData = await request.getPatientListForDoctor(doctor.usermail);

    print(responseData);

    List<dynamic> jsonList = jsonDecode(responseData)['data'];

    List<Patient> patientsFromDoctor = Patient.fromMap(jsonList);
    for (Patient patient in patientsFromDoctor) {
      print('ID: ${patient.id}, Username: ${patient.username}');
      // Diğer özelliklere erişmek için aynı şekilde kullanabilirsiniz.
    }
    setState(() {
      patients = patientsFromDoctor; // Hastaları güncelle
    });
  }
}
