import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harpia_project/utils/Validation.dart';

import '../../core/ResponsiveDesign.dart';
import '../../model/user/Doctor.dart';
import '../../network/HttpRequestDoctor.dart';
import '../../utils/Constant.dart';
import '../../utils/CustomAlertDialog.dart';
import '../../utils/ProductColor.dart';

class DoctorSignUpPage extends StatefulWidget {
  const DoctorSignUpPage({Key? key}) : super(key: key);

  @override
  State<DoctorSignUpPage> createState() => _DoctorSignUpPageState();
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
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

  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    genders.add(Gender('cinsiyet_male'.tr(), Icons.male, true));
    genders.add(Gender('cinsiyet_female'.tr(), Icons.female, false));
  }

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
                                            SizedBox(
                                                height: Constat
                                                    .doctorRegisterPanelWidgetSpace),
                                            SizedBox(
                                              width: 250.w,
                                              height: 70.h,
                                              child: Align(
                                                alignment: Alignment
                                                    .center, // Ortalamayı sağlar
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: genders.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    final gender =
                                                        genders[index];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.pinkAccent,
                                                      onTap: () {
                                                        setState(() {
                                                          genders.forEach(
                                                              (gender) => gender
                                                                      .isSelected =
                                                                  false);
                                                          genders[index]
                                                                  .isSelected =
                                                              true;
                                                          selectGender(
                                                              genders[index]);
                                                        });
                                                      },
                                                      child: CustomRadio(
                                                          genders[index]),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
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
                      child: Text('register'.tr()),
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
      maxLength: lblTxt == 'nationality_id'
          ? Validation.tcCharacterSize
          : lblTxt == 'prompt_password'
              ? Validation.maxPasswordCharacterSize
              : Validation.maxNumberCharacterSize,
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
        if (lblTxt == 'prompt_password' && value.length < 6) {
          return 'number_of_entered_password_characters_must_be_greater_than_6'
              .tr();
        }
        if (lblTxt == 'nationality_id' &&
            value.replaceAll(' ', '').length < Validation.tcCharacterSize) {
          return "11 haneli tc numaranızı giriniz";
        }
        return null;
      },
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 30,
          color: ProductColor.darkBlue),
    );
  }

  void selectGender(Gender selectedGender) {
    setState(() {
      genders.forEach((gender) => gender.isSelected = false);
      selectedGender.isSelected = true;
    });
  }

  void signUpProcess(BuildContext context) {
    showAlertDialogInvalidUsernameOrPassword(
        context: context,
        msg: genders.firstWhere((gender) => gender.isSelected).name);
    bool controlResult = formKey.currentState!.validate();
    if (controlResult) {
      String DoctorUserName = firstNameController.text;
      String DoctoruserLastName = lastNameController.text;
      String DoctorUserMail = emailController.text;
      String DoctorUserPassword = passwordController.text;
      String DoctorUserTC = tcController.text;
      String DoctorUserBirtTime = birthDateController.text;
      String DoctorUserInstitue = institutionController.text;
      String selectedGender = genders
          .firstWhere((gender) => gender.isSelected)
          .name; // Seçilen cinsiyeti alıyoruz
      if (!Validation().isEmailValid(DoctorUserMail)) {
        showAlertDialogInvalidUsernameOrPassword(
            context: context,
            msg: 'please_enter_mail_address_in_the_appropriate_format'.tr());
        return;
      }
      var request = HttpRequestDoctor();
      Doctor doctor = Doctor(
          0,
          DoctorUserName,
          DoctoruserLastName,
          selectedGender, // Seçilen cinsiyeti burada kullanıyoruz
          int.parse(DoctorUserTC),
          DoctorUserBirtTime,
          DoctorUserInstitue,
          DoctorUserMail,
          DoctorUserPassword,
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

  void showAlertDialogInvalidUsernameOrPassword(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (builder) => CustomAlertDialog.getAlertDialogUserSignUp(
            success: false,
            context: context,
            title: "Sign-Up",
            subTitle: "Failed :",
            msg: msg,
            roleId: 0));
  }
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _gender.isSelected ? Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 40,
          width: 80,
          alignment: Alignment.center,
          margin: new EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                size: 35,
              ),
              SizedBox(height: 5),
              Text(
                _gender.name,
                style: TextStyle(
                    fontSize: ResponsiveDesign.getScreenWidth() / 30,
                    color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}
