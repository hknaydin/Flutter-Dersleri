import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/ResponsiveDesign.dart';

import '../../utils/Constant.dart';
import '../../utils/ProductColor.dart';

class PatientSignUpPage extends StatefulWidget {
  const PatientSignUpPage({Key? key}) : super(key: key);

  @override
  State<PatientSignUpPage> createState() => _PatientSignUpPageState();
}

final _formKey = GlobalKey<FormState>();
// final _diseaseKey = GlobalKey<FormFieldState>();

class DoctorPicklistItem {
  int index;
  int id;
  String name;

  DoctorPicklistItem(
      {required this.index, required this.id, required this.name});

  @override
  String toString() {
    return 'DoctorPicklistItem{index: $index, id: $id, name: $name}';
  }
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String? _selectedDoctor;

  @override
  Widget build(BuildContext context) {
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
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    'patient_register_panel'.tr(),
                    style: GoogleFonts.abrilFatface(
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
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Card(
                              elevation: 0,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          PatientInputFormField(
                                              _firstNameController,
                                              Icon(
                                                Icons.person,
                                                color: Colors.blue,
                                              ),
                                              'name',
                                              'enter_your_name',
                                              'please_enter_your_first_name',
                                              TextInputType.text),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _lastNameController,
                                              Icon(
                                                Icons.person,
                                                color: Colors.blue,
                                              ),
                                              'surname',
                                              'enter_your_surname',
                                              'please_enter_your_last_name',
                                              TextInputType.number),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _emailController,
                                              const Icon(
                                                Icons.mail_rounded,
                                                color: Colors.blue,
                                              ),
                                              'prompt_email',
                                              'prompt_email',
                                              'please_enter_mail_address_in_the_appropriate_format',
                                              TextInputType.number),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _phoneNumberController,
                                              const Icon(
                                                Icons.phone_android_outlined,
                                                color: Colors.blue,
                                              ),
                                              'phone_number',
                                              'enter_your_phone',
                                              'please_enter_your_phone_number',
                                              TextInputType.number),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _tcController,
                                              Icon(
                                                Icons.password,
                                                color: Colors.blue,
                                              ),
                                              'nationality_id',
                                              'enter_your_nationality_id',
                                              'please_enter_your_nationality_TC_number',
                                              TextInputType.number),
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
                                                    fontSize: ResponsiveDesign.getScreenWidth() /
                                                        30,
                                                    color: ProductColor.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                hintText:
                                                    'enter_your_surname'.tr(),
                                                hintStyle: TextStyle(
                                                    fontSize: ResponsiveDesign
                                                            .getScreenWidth() /
                                                        30),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(10.0)),
                                                    borderSide: BorderSide(
                                                        color: ProductColor
                                                            .darkBlue)),
                                                filled: true,
                                                fillColor: ProductColor.white,
                                                border: const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(Radius.circular(10.0)))),
                                          ),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _birthDateController,
                                              Icon(
                                                Icons.date_range,
                                                color: Colors.blue,
                                              ),
                                              'hasta_dogum_tarihi',
                                              'date_of_birth_10_10_1991',
                                              'please_enter_your_birtday_time',
                                              TextInputType.number),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              _passwordController,
                                              Icon(
                                                Icons.password_outlined,
                                                color: Colors.blue,
                                              ),
                                              'prompt_password',
                                              'please_enter_the_password',
                                              'please_enter_password_that_is_difficult_to_guess',
                                              TextInputType.number),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
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
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  SizedBox(
                    width: 180.w,
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.sp),
                                      side: BorderSide(color: Colors.pink))),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.pink),
                          foregroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white)),
                      child: Text('Register as Patient'),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: Constat.doctorRegisterPanelWidgetSpace),
      ],
    );
  }

  TextFormField PatientInputFormField(
      TextEditingController controller,
      Icon icon,
      String lblTxt,
      String lblHintTxt,
      String returnMessage,
      TextInputType keyboardType) {
    return TextFormField(
      controller: controller,
      keyboardType:
          keyboardType, // keyboardType'ı ilgili parametre olarak ayarlayın
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
          return returnMessage.tr();
        }
        return null;
      },
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 30,
          color: ProductColor.darkBlue),
    );
  }
}
