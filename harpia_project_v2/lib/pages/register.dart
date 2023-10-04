import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/utils/Constant.dart';

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
        Expanded(
          child:Center(
            child: SingleChildScrollView(
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
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              SizedBox(height: 12.h),
                              Text(
                                'register_panel'.tr(),
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
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'name'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'enter_your_name'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
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
                                              ResponsiveDesign.getScreenWidth() / 30,
                                          color: ProductColor.darkBlue),
                                    ),
                                    SizedBox(
                                        height:
                                            Constat.doctorRegisterPanelWidgetSpace),
                                    TextFormField(
                                      controller: _lastNameController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'surname'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'enter_your_surname'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
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
                                          return 'Please enter your last name';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveDesign.getScreenWidth() / 30,
                                          color: ProductColor.darkBlue),
                                    ),
                                    SizedBox(
                                        height:
                                            Constat.doctorRegisterPanelWidgetSpace),
                                    TextFormField(
                                      controller: _tcController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.password,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'nationality_id'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'enter_your_nationality_id'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: ProductColor.darkBlue)),
                                          filled: true,
                                          fillColor: ProductColor.white,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your TC Kimlik No';
                                        }
                                        // Diğer doğrulama mantığı burada eklenebilir
                                        return null;
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Sadece rakam girişi kabul eder
                                        LengthLimitingTextInputFormatter(
                                            11), // Maksimum 11 karakter kabul eder
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            Constat.doctorRegisterPanelWidgetSpace),
                                    TextFormField(
                                      controller: _birthDateController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.date_range,
                                            color: Colors.blue,
                                          ),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          labelText: 'hasta_dogum_tarihi'.tr(),
                                          hintText: 'date_of_birth_10_10_1991'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: ProductColor.darkBlue)),
                                          filled: true,
                                          fillColor: ProductColor.white,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                      keyboardType: TextInputType.datetime,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your birth date';
                                        }
                                        // Diğer doğrulama mantığı burada eklenebilir
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                        height:
                                            Constat.doctorRegisterPanelWidgetSpace),
                                    TextFormField(
                                      controller: _institutionController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.location_city,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'institue'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'employed_institution'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
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
                                          return 'Please enter the institution you work for';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                        height:
                                            Constat.doctorRegisterPanelWidgetSpace),
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.mail_rounded,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'prompt_email'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30,
                                              color: ProductColor.black,
                                              fontWeight: FontWeight.bold),
                                          hintText: 'prompt_email'.tr(),
                                          hintStyle: TextStyle(
                                              fontSize:
                                                  ResponsiveDesign.getScreenWidth() /
                                                      30),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: ProductColor.darkBlue)),
                                          filled: true,
                                          fillColor: ProductColor.white,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                        height:
                                        Constat.doctorRegisterPanelWidgetSpace),

                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.password_outlined,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'prompt_password'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize:
                                                ResponsiveDesign.getScreenWidth() /
                                                    30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'please_enter_the_password'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize:
                                                ResponsiveDesign.getScreenWidth() /
                                                    30),
                                          focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: ProductColor.darkBlue)),
                                          filled: true,
                                          fillColor: ProductColor.white,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)))
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a password';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 16.0),
                                    SizedBox(
                                      width: 100.w,
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            // Doktor kaydı işlemini gerçekleştirin.
                                            // _firstNameController.text, _lastNameController.text,
                                            // _emailController.text, _passwordController.text ve
                                            // diğer gerekli alanlardan gelen verileri kullanabilirsiniz.
                                            // Seçilen doktoru _selectedDoctor değişkeninden alabilirsiniz.
                                          }
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(18.sp),
                                                    side: BorderSide(
                                                        color: Colors.pink))),
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.pink),
                                            foregroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors.white)),
                                        child: Text('Register as Doctor'),
                                      ),
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
            ),
        ),
      ],
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
        Expanded(
          child: Center(
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
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [
                            SizedBox(height: 12.h),
                            Text(
                              'patient_register_panel'.tr(),
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
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'name'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'enter_your_name'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
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
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _lastNameController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'surname'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'enter_your_surname'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
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
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.mail_rounded,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'prompt_email'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'prompt_email'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                      Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _phoneNumberController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone_android_outlined,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'phone_number'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'enter_your_phone'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      // Diğer doğrulama mantığı burada eklenebilir
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _tcController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.password,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'nationality_id'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText:
                                            'enter_your_nationality_id'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your TC No';
                                      }
                                      // Diğer doğrulama mantığı burada eklenebilir
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
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
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'Select a Doctor',
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'enter_your_surname'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _birthDateController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.date_range,
                                          color: Colors.blue,
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        labelText: 'hasta_dogum_tarihi'.tr(),
                                        hintText: 'date_of_birth_10_10_1991'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize: ResponsiveDesign
                                                    .getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))),
                                    keyboardType: TextInputType.datetime,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your birth date';
                                      }
                                      // Diğer doğrulama mantığı burada eklenebilir
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.password_outlined,
                                          color: Colors.blue,
                                        ),
                                        labelText: 'prompt_password'.tr(),
                                        labelStyle: TextStyle(
                                            fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                30,
                                            color: ProductColor.black,
                                            fontWeight: FontWeight.bold),
                                        hintText: 'please_enter_the_password'.tr(),
                                        hintStyle: TextStyle(
                                            fontSize:
                                            ResponsiveDesign.getScreenWidth() /
                                                30),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: ProductColor.darkBlue)),
                                        filled: true,
                                        fillColor: ProductColor.white,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)))
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a password';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          Constat.doctorRegisterPanelWidgetSpace),
                                  SizedBox(
                                    width: 100.w,
                                    height: 50.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Hasta kaydı işlemini gerçekleştirin.
                                          // _firstNameController.text, _lastNameController.text,
                                          // _emailController.text, _passwordController.text ve
                                          // diğer gerekli alanlardan gelen verileri kullanabilirsiniz.
                                        }
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.sp),
                                                  side: BorderSide(
                                                      color: Colors.pink))),
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.pink),
                                          foregroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white)),
                                      child: Text('Register as Patient'),
                                    ),
                                  ),
                                ],
                              ),
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
        ),
      ],
    );
  }
}
