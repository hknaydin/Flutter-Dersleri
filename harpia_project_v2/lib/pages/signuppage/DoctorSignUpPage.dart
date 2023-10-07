import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/ResponsiveDesign.dart';
import '../../model/user/Doctor.dart';
import '../../network/HttpRequestDoctor.dart';
import '../../utils/Constant.dart';
import '../../utils/ProductColor.dart';

class DoctorSignUpPage extends StatefulWidget {
  const DoctorSignUpPage({Key? key}) : super(key: key);

  @override
  State<DoctorSignUpPage> createState() => _DoctorSignUpPageState();
}

class _DoctorSignUpPageState extends State<DoctorSignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController tcController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();

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
                    'register_panel'.tr(),
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
                      child: Form(
                        key: formKey,
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
                                            DoctorInputFormField(
                                                firstNameController,
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
                                            DoctorInputFormField(
                                                lastNameController,
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.blue,
                                                ),
                                                'surname',
                                                'enter_your_surname',
                                                'please_enter_your_last_name',
                                                TextInputType.text),
                                            SizedBox(
                                                height: Constat
                                                    .doctorRegisterPanelWidgetSpace),
                                            DoctorInputFormField(
                                                tcController,
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
                                            DoctorInputFormField(
                                                birthDateController,
                                                Icon(
                                                  Icons.date_range,
                                                  color: Colors.blue,
                                                ),
                                                'hasta_dogum_tarihi',
                                                'date_of_birth_10_10_1991',
                                                'please_enter_your_birtday_time',
                                                TextInputType.text),
                                            SizedBox(
                                                height: Constat
                                                    .doctorRegisterPanelWidgetSpace),
                                            DoctorInputFormField(
                                                institutionController,
                                                Icon(
                                                  Icons.location_city,
                                                  color: Colors.blue,
                                                ),
                                                'institue',
                                                'employed_institution',
                                                'please_enter_your_institution',
                                                TextInputType.text),
                                            SizedBox(
                                                height: Constat
                                                    .doctorRegisterPanelWidgetSpace),
                                            DoctorInputFormField(
                                                emailController,
                                                Icon(
                                                  Icons.mail_rounded,
                                                  color: Colors.blue,
                                                ),
                                                'prompt_email',
                                                'prompt_email',
                                                'please_enter_mail_address_in_the_appropriate_format',
                                                TextInputType.text),
                                            SizedBox(
                                                height: Constat
                                                    .doctorRegisterPanelWidgetSpace),
                                            DoctorInputFormField(
                                                passwordController,
                                                Icon(
                                                  Icons.password_outlined,
                                                  color: Colors.blue,
                                                ),
                                                'prompt_password',
                                                'please_enter_the_password',
                                                'please_enter_password_that_is_difficult_to_guess',
                                                TextInputType.text),
                                            SizedBox(height: 16.0),
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
                        signUpProcess(context);
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
                      child: Text('Register as Doctor'),
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

  TextFormField DoctorInputFormField(
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

  void signUpProcess(BuildContext context) {
    bool controlResult = formKey.currentState!.validate();
    if (controlResult) {
      String userName = firstNameController.text;
      String userLastName = lastNameController.text;
      String userMail = emailController.text;
      String userPassword = passwordController.text;
      String userTC = tcController.text;
      String userBirtTime = birthDateController.text;
      String userInstitue = institutionController.text;

      var request = HttpRequestDoctor();
      Doctor doctor = new Doctor(
          0,
          userName,
          userLastName,
          "erkek",
          int.parse(userTC),
          userBirtTime,
          userInstitue,
          userMail,
          userPassword,
          "DOCTOR",
          true);
      request.signUp(doctor).then((resp) async {
        // debugPrint(resp.body);
        Map<String, dynamic> jsonData = json.decode(resp.body);
        // print("res.body : ${resp.body}");
        //var respEntity = ResponseEntity.fromJson(jsonData);
      });
    }
  }
}
