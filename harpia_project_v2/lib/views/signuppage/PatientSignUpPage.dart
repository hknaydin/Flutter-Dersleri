import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/ResponsiveDesign.dart';

import '../../utils/Constant.dart';
import '../../utils/CustomAlertDialog.dart';
import '../../utils/ProductColor.dart';
import '../../utils/Validation.dart';

class PatientSignUpPage extends StatefulWidget {
  const PatientSignUpPage({Key? key}) : super(key: key);

  @override
  State<PatientSignUpPage> createState() => _PatientSignUpPageState();
}

bool isVisible = true;

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
  final GlobalKey<FormState> formPatientKey = GlobalKey<FormState>();
  final TextEditingController patientFirstNameController =
      TextEditingController();
  final TextEditingController patientLastNameController =
      TextEditingController();
  final TextEditingController patientEmailController = TextEditingController();
  final TextEditingController patientPasswordController =
      TextEditingController();
  final TextEditingController patietPhoneNumberController =
      TextEditingController();
  final TextEditingController patientTcController = TextEditingController();
  final TextEditingController patientBirthDateController =
      TextEditingController();
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
                        key: formPatientKey,
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
                                              patientFirstNameController,
                                              const Icon(
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
                                              patientLastNameController,
                                              const Icon(
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
                                          PatientInputFormField(
                                              patientEmailController,
                                              const Icon(
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
                                          PatientInputFormField(
                                              patietPhoneNumberController,
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
                                              patientTcController,
                                              const Icon(
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
                                          PatientInputFormFieldDataPicker(
                                              patientBirthDateController,
                                              const Icon(
                                                Icons.date_range,
                                                color: Colors.blue,
                                              ),
                                              'hasta_dogum_tarihi',
                                              'date_of_birth_10_10_1991',
                                              'please_enter_your_birtday_time',
                                              TextInputType.datetime),
                                          SizedBox(
                                              height: Constat
                                                  .doctorRegisterPanelWidgetSpace),
                                          PatientInputFormField(
                                              patientPasswordController,
                                              const Icon(
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
                        if (formPatientKey.currentState!.validate()) {
                          signUpProcess(context);
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

  TextFormField PatientInputFormField(
      TextEditingController controller,
      Icon icon,
      String lblTxt,
      String lblHintTxt,
      String returnMessage,
      TextInputType keyboardType) {
    return TextFormField(
      controller: controller,
      obscureText: lblTxt == 'prompt_password' ? isVisible : false,
      maxLength: lblTxt == 'nationality_id'
          ? Validation.tcCharacterSize
          : lblTxt == 'prompt_password'
              ? Validation.maxPasswordCharacterSize
              : Validation.maxNumberCharacterSize,
      keyboardType:
          keyboardType, // keyboardType'ı ilgili parametre olarak ayarlayın
      decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: lblTxt == 'prompt_password'
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child:
                      Icon(isVisible ? Icons.visibility : Icons.visibility_off))
              : null,
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
        return null;
      },
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 30,
          color: ProductColor.darkBlue),
    );
  }

  TextFormField PatientInputFormFieldDataPicker(
      TextEditingController controller,
      Icon icon,
      String lblTxt,
      String lblHintTxt,
      String returnMessage,
      TextInputType keyboardType) {
    return TextFormField(
      controller: controller,
      readOnly: true,
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
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            controller.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
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

  void signUpProcess(BuildContext context) {
    bool controlResult = formPatientKey.currentState!.validate();
    if (controlResult) {
      String patientUserName = patientFirstNameController.text;
      String patientUserLastName = patientLastNameController.text;
      String patientUserMail = patientEmailController.text;
      String patientUserPassword = patientPasswordController.text;
      String patientUserTC = patientTcController.text;
      String patientUserBirtTime = patientBirthDateController.text;
      if (!Validation().isEmailValid(patientUserMail)) {
        showAlertDialogInvalidUsernameOrPassword(
            context: context,
            msg: 'please_enter_mail_address_in_the_appropriate_format'.tr());
        return;
      }
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
