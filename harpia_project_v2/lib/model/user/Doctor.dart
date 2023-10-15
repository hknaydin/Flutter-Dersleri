class Doctor {
  int id;
  String username;
  String userlastname;
  String gender;
  String usermail;
  String password;
  String role;
  int tc;
  String dataofBirth;
  String employedInstitution;
  bool loggedIn;

  Doctor({
    required this.id,
    required this.username,
    required this.userlastname,
    required this.gender,
    required this.usermail,
    required this.password,
    required this.role,
    required this.tc,
    required this.dataofBirth,
    required this.employedInstitution,
    required this.loggedIn,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'userlastname': userlastname,
      'gender': gender,
      'tc': tc,
      'dataofBirth': dataofBirth,
      'employedInstitution': employedInstitution,
      'usermail': usermail,
      'password': password,
      'role': role,
      'loggedIn': loggedIn,
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      username: json['username'],
      userlastname: json['userlastname'],
      gender: json['gender'],
      usermail: json['usermail'],
      password: json['password'],
      role: json['role'],
      tc: json['tc'],
      dataofBirth: json['dataofBirth'],
      employedInstitution: json['employedInstitution'],
      loggedIn: json['loggedIn'],
    );
  }
}
