import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/ResponsiveDesign.dart';
import '../utils/ProductColor.dart';

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
        body: TabBarView(
          children: [
            buildDoctorTab(),
            buildPatientTab(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: 'Doctor'),
            Tab(text: 'Patient'),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorTab() {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_login.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        Text(
                          'admin_panel'.tr(),
                          style: TextStyle(
                            fontSize: ResponsiveDesign.getScreenWidth() / 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 1.h,
                          width: double.infinity,
                          color: Colors.grey,
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _firstNameController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(
                                        fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                23,
                                        color: ProductColor.black,
                                        fontWeight: FontWeight.bold),
                                    hintText: "prompt_email".tr(),
                                    hintStyle: TextStyle(
                                        fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                20),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: ProductColor.darkBlue)),
                                    filled: true,
                                    fillColor: ProductColor.white,
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    fontSize:
                                        ResponsiveDesign.getScreenWidth() / 22,
                                    color: ProductColor.darkBlue),
                              ),
                              TextFormField(
                                controller: _lastNameController,
                                decoration:
                                    InputDecoration(labelText: 'Last Name'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: _tcController,
                                decoration:
                                    InputDecoration(labelText: 'TC Kimlik No'),
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
                                decoration:
                                    InputDecoration(labelText: 'Doğum Tarihi'),
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
                                decoration: InputDecoration(
                                    labelText: 'Çalıştığı Kurum'),
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
                                decoration: InputDecoration(
                                    labelText: 'Select a Doctor'),
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
                                decoration:
                                    InputDecoration(labelText: 'Password'),
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
                                decoration:
                                    InputDecoration(labelText: 'Phone Number'),
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
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPatientTab() {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header_login.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(0.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 12.h),
                          TextFormField(
                            controller: _firstNameController,
                            decoration:
                                InputDecoration(labelText: 'First Name'),
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
                            decoration:
                                InputDecoration(labelText: 'Phone Number'),
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
                            decoration:
                                InputDecoration(labelText: 'Doğum Tarihi'),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
