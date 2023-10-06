class User {
  late int id;
  late String username;
  late String userlastname;
  late String gender;
  late String usermail;
  late String password;
  late String role;

  User({
    required this.id,
    required this.username,
    required this.userlastname,
    required this.gender,
    required this.usermail,
    required this.password,
    required this.role,
  });

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    userlastname = map['userlastname'];
    gender = map['gender'];
    usermail = map['usermail'];
    password = map['password'];
    role = map['role'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'userlastname': userlastname,
      'gender': gender,
      'usermail': usermail,
      'password': password,
      'role': role,
    };
  }
}
