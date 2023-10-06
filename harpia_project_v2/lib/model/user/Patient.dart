import 'User.dart';

class Patient extends User {
  late int id;
  late String username;
  late String userlastname;
  late String gender;
  late String usermail;
  late String password;
  late String role;
  int tcNo;
  String bloodInformation;
  String weight;
  String length;
  String nationality;
  String placeOfBirth;
  String dataOfBirth;
  String telNo;
  int doctorId;
  String sensorPeriod;
  int hipoGlisemi;
  int hiperGlisemi;
  int authorized;

  Patient({
    required int id,
    required String username,
    required String userlastname,
    required String gender,
    required this.tcNo,
    required this.bloodInformation,
    required this.weight,
    required this.length,
    required this.nationality,
    required this.placeOfBirth,
    required this.dataOfBirth,
    required this.telNo,
    required String usermail,
    required String password,
    required String role,
    required this.doctorId,
    required this.sensorPeriod,
    required this.hipoGlisemi,
    required this.hiperGlisemi,
    required this.authorized,
  }) : super(
          id: id,
          username: username,
          userlastname: userlastname,
          gender: gender,
          usermail: usermail,
          password: password,
          role: role,
        );

  Patient.fromMap(Map<String, dynamic> map)
      : tcNo = map['tc_no'],
        bloodInformation = map['blood_information'],
        weight = map['weight'],
        length = map['length'],
        nationality = map['nationality'],
        placeOfBirth = map['place_of_birth'],
        dataOfBirth = map['data_of_birth'],
        telNo = map['tel_no'],
        doctorId = map['doctor_id'],
        sensorPeriod = map['sensor_period'],
        hipoGlisemi = map['hipo_glisemi'],
        hiperGlisemi = map['hiper_glisemi'],
        authorized = map['authorized'],
        super.fromMap(map);

  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['tc_no'] = tcNo;
    map['blood_information'] = bloodInformation;
    map['weight'] = weight;
    map['length'] = length;
    map['nationality'] = nationality;
    map['place_of_birth'] = placeOfBirth;
    map['data_of_birth'] = dataOfBirth;
    map['tel_no'] = telNo;
    map['doctor_id'] = doctorId;
    map['sensor_period'] = sensorPeriod;
    map['hipo_glisemi'] = hipoGlisemi;
    map['hiper_glisemi'] = hiperGlisemi;
    map['authorized'] = authorized;
    return map;
  }
}
