import 'package:flutter/material.dart';

enum UserType {
  Doctor,
  Patient,
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  UserType _userType = UserType.Doctor;
  String? _selectedDoctor;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _tcController.dispose();
    _birthDateController.dispose();
    _institutionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Doctor'),
              Tab(text: 'Patient'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildDoctorTab(),
            buildPatientTab(),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _tcController,
              decoration: InputDecoration(labelText: 'TC Kimlik No'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your TC Kimlik No';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            TextFormField(
              controller: _birthDateController,
              decoration: InputDecoration(labelText: 'Doğum Tarihi'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your birth date';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            TextFormField(
              controller: _institutionController,
              decoration: InputDecoration(labelText: 'Çalıştığı Kurum'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the institution you work for';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: _selectedDoctor,
              items: [
                DropdownMenuItem(
                  child: Text('Doctor 1'),
                  value: 'Doctor 1',
                ),
                DropdownMenuItem(
                  child: Text('Doctor 2'),
                  value: 'Doctor 2',
                ),
                DropdownMenuItem(
                  child: Text('Doctor 3'),
                  value: 'Doctor 3',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedDoctor = value;
                });
              },
              decoration: InputDecoration(labelText: 'Select a Doctor'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Doktor kaydı işlemini gerçekleştirin.
                  // _firstNameController.text, _lastNameController.text,
                  // _emailController.text, _passwordController.text ve
                  // diğer gerekli alanlardan gelen verileri kullanabilirsiniz.
                  // Seçilen doktoru _selectedDoctor değişkeninden alabilirsiniz.
                }
              },
              child: Text('Register as Doctor'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPatientTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            TextFormField(
              controller: _tcController,
              decoration: InputDecoration(labelText: 'TC No'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your TC No';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            TextFormField(
              controller: _birthDateController,
              decoration: InputDecoration(labelText: 'Doğum Tarihi'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your birth date';
                }
                // Diğer doğrulama mantığı burada eklenebilir
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Hasta kaydı işlemini gerçekleştirin.
                  // _firstNameController.text, _lastNameController.text,
                  // _emailController.text, _passwordController.text ve
                  // diğer gerekli alanlardan gelen verileri kullanabilirsiniz.
                }
              },
              child: Text('Register as Patient'),
            ),
          ],
        ),
      ),
    );
  }
}
