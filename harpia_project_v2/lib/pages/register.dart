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
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
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
          child: Center(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
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
                                  fontSize:
                                      ResponsiveDesign.getScreenWidth() / 23,
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
                                    DoctorInputFormField(
                                        _firstNameController,
                                        Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        'name',
                                        'enter_your_name',
                                        'Please enter your first name'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _lastNameController,
                                        Icon(
                                          Icons.person,
                                          color: Colors.blue,
                                        ),
                                        'surname',
                                        'enter_your_surname',
                                        'Please enter your last name'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _tcController,
                                        Icon(
                                          Icons.password,
                                          color: Colors.blue,
                                        ),
                                        'nationality_id',
                                        'enter_your_nationality_id',
                                        'Please enter your TC Kimlik No'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _birthDateController,
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.blue,
                                        ),
                                        'hasta_dogum_tarihi',
                                        'date_of_birth_10_10_1991',
                                        'Please enter your birth date'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _institutionController,
                                        Icon(
                                          Icons.location_city,
                                          color: Colors.blue,
                                        ),
                                        'institue',
                                        'employed_institution',
                                        'Please enter the institution you work for'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _emailController,
                                        Icon(
                                          Icons.mail_rounded,
                                          color: Colors.blue,
                                        ),
                                        'prompt_email',
                                        'prompt_email',
                                        'Please enter your email address'),
                                    SizedBox(
                                        height: Constat
                                            .doctorRegisterPanelWidgetSpace),
                                    DoctorInputFormField(
                                        _passwordController,
                                        Icon(
                                          Icons.password_outlined,
                                          color: Colors.blue,
                                        ),
                                        'prompt_password',
                                        'please_enter_the_password',
                                        'Please enter a password'),
                                    SizedBox(height: 16.0),
                                    SizedBox(
                                      width: 100.w,
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
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

  TextFormField DoctorInputFormField(TextEditingController controller,
      Icon icon, String lblTxt, String lblHintTxt, String returnMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: icon,
          labelText: lblTxt.tr(),
          labelStyle: TextStyle(
              fontSize: ResponsiveDesign.getScreenWidth() / 30,
              color: ProductColor.black,
              fontWeight: FontWeight.bold),
          hintText: lblHintTxt.tr(),
          hintStyle:
              TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 30),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ProductColor.darkBlue)),
          filled: true,
          fillColor: ProductColor.white,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      validator: (value) {
        if (value!.isEmpty) {
          return returnMessage;
        }
        return null;
      },
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 30,
          color: ProductColor.darkBlue),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                fontSize:
                                    ResponsiveDesign.getScreenWidth() / 23,
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
                                  DoctorInputFormField(
                                      _firstNameController,
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      'name',
                                      'enter_your_name',
                                      'Please enter your first name'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _lastNameController,
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      'surname',
                                      'enter_your_surname',
                                      'Please enter your last name'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _emailController,
                                      Icon(
                                        Icons.mail_rounded,
                                        color: Colors.blue,
                                      ),
                                      'prompt_email',
                                      'prompt_email',
                                      'Please enter your email address'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _phoneNumberController,
                                      Icon(
                                        Icons.phone_android_outlined,
                                        color: Colors.blue,
                                      ),
                                      'phone_number',
                                      'enter_your_phone',
                                      'Please enter your phone number'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _tcController,
                                      Icon(
                                        Icons.password,
                                        color: Colors.blue,
                                      ),
                                      'nationality_id',
                                      'enter_your_nationality_id',
                                      'Please enter your TC Kimlik No'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
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
                                            borderRadius:
                                                const BorderRadius.all(
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
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _birthDateController,
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      ),
                                      'hasta_dogum_tarihi',
                                      'date_of_birth_10_10_1991',
                                      'Please enter your birth date'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
                                  DoctorInputFormField(
                                      _passwordController,
                                      Icon(
                                        Icons.password_outlined,
                                        color: Colors.blue,
                                      ),
                                      'prompt_password',
                                      'please_enter_the_password',
                                      'Please enter a password'),
                                  SizedBox(
                                      height: Constat
                                          .doctorRegisterPanelWidgetSpace),
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
