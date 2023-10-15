import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/model/user/Doctor.dart';

import '../../model/user/Patient.dart';
import '../../network/HttpRequestDoctor.dart';

class PatientForDoctor extends StatefulWidget {
  final Doctor doctor;

  const PatientForDoctor({super.key, required this.doctor});

  @override
  State<PatientForDoctor> createState() =>
      PatientPageForDoctorState(doctor: doctor);
}

class PatientPageForDoctorState extends State<PatientForDoctor>
    with SingleTickerProviderStateMixin {
  late String doctorName = "";
  final Doctor doctor;
  late List<Patient> patients = []; // Hasta bilgilerini tutmak için bir liste

  PatientPageForDoctorState({required this.doctor});

  @override
  void initState() {
    super.initState();
    fetchPatients(doctor);
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
                      // Hasta detay sayfasına yönlendirme işlemlerini burada gerçekleştirin
                    },
                  ),
                );
              },
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
}
