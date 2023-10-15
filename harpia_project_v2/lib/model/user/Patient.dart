class Patient {
  int id;
  String username;
  String userlastname;
  String gender;
  String usermail;
  String password;
  String role;
  int tc_no;
  String blood_information;
  String weight;
  String length;
  String nationality;
  String place_of_birth;
  String data_of_birth;
  String tel_no;
  int doctor_id;
  String sensor_period;
  int hipo_glisemi;
  int hiper_glisemi;
  int authorized;

  Patient({
    required this.id,
    required this.username,
    required this.userlastname,
    required this.gender,
    required this.tc_no,
    required this.blood_information,
    required this.weight,
    required this.length,
    required this.nationality,
    required this.place_of_birth,
    required this.data_of_birth,
    required this.tel_no,
    required this.usermail,
    required this.password,
    required this.role,
    required this.doctor_id,
    required this.sensor_period,
    required this.hipo_glisemi,
    required this.hiper_glisemi,
    required this.authorized,
  });
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      username: json['username'],
      userlastname: json['userlastname'],
      gender: json['gender'],
      tc_no: json['tc_no'],
      blood_information: json['blood_information'],
      weight: json['weight'],
      length: json['length'],
      nationality: json['nationality'],
      place_of_birth: json['place_of_birth'],
      data_of_birth: json['data_of_birth'],
      tel_no: json['tel_no'],
      usermail: json['usermail'],
      password: json['password'],
      role: json['role'],
      doctor_id: json['doctor_id'],
      sensor_period: json['sensor_period'],
      hipo_glisemi: json['hipo_glisemi'],
      hiper_glisemi: json['hiper_glisemi'],
      authorized: json['authorized'],
    );
  }
  static List<Patient> fromMap(List<dynamic> jsonList) {
    List<Patient> patients = [];
    for (Map<String, dynamic> json in jsonList) {
      patients.add(Patient.fromJson(json));
    }
    return patients;
  }
}
