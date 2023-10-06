class Doctor {
  late int id;
  late String username;
  late String userlastname;
  late String gender;
  late String usermail;
  late String password;
  late String role;
  late int tc;
  late String dataofBirth;
  late String employedInstitution;
  late bool loggedIn;

  Doctor(
      this.id,
      this.username,
      this.userlastname,
      this.gender,
      this.tc,
      this.dataofBirth,
      this.employedInstitution,
      this.usermail,
      this.password,
      this.role,
      this.loggedIn);

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
      'loggedIn': "true",
    };
  }
}
