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
  late List<Patient> patients = []; // Hasta bilgilerini tutmak için bir liste
  @override
  void initState() {
    super.initState();
    fetchPatients(); // Hasta bilgilerini çeken fonksiyonu çağır
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
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                // Her bir hasta için bir ListTile oluştur
                Patient patient = patients[index];
                IconData genderIcon =
                    patient.gender == Gender.male ? Icons.male : Icons.female;

                return ListTile(
                  leading: Icon(genderIcon),
                  title: Text(patient.name),
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
                onPressed: fetchPatients,
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

  void fetchPatients() {
    // Burada backend tarafından hasta bilgilerini çekme işlemini gerçekleştirirsiniz
    // Örnek olarak, sabit bir liste kullanalım
    List<Patient> fetchedPatients = [
      Patient(name: "John Doe", gender: Gender.male),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smithxn", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),
      Patient(name: "Jane Smith", gender: Gender.female),

      // Diğer hastaları buraya ekleyin
    ];

    setState(() {
      patients = fetchedPatients; // Hastaları güncelle
    });
  }
}

class Patient {
  final String name;
  final Gender gender;

  Patient({required this.name, required this.gender});
}

enum Gender {
  male,
  female,
}
