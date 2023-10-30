class PatientGlikozValues {
  int patient_id;
  String login_time;
  String glikoz_value;
  PatientGlikozValues({
    required this.patient_id,
    required this.login_time,
    required this.glikoz_value,
  });

  static List<PatientGlikozValues> fromMap(List<dynamic> jsonList) {
    List<PatientGlikozValues> patientGlikozList = [];
    for (Map<String, dynamic> json in jsonList) {
      patientGlikozList.add(PatientGlikozValues.fromJson(json));
    }
    return patientGlikozList;
  }

  static PatientGlikozValues fromJson(Map<String, dynamic> json) {
    return PatientGlikozValues(
      patient_id: json['patient_id'],
      login_time: json['login_time'],
      glikoz_value: json['glikoz_value'],
    );
  }
}
