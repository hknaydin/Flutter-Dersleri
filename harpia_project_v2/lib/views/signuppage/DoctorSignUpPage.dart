import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harpia_project/utils/Validation.dart';

import '../../core/ResponsiveDesign.dart';
import '../../model/user/Doctor.dart';
import '../../network/HttpRequestDoctor.dart';
import '../../result/dataResult.dart';
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

bool isVisible = true;

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
  bool checkedValue = false;
  bool success = false;

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
                                            DoctorInputFormFieldDataPicker(
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
                                            FlutterPwValidator(
                                              defaultColor:
                                                  Colors.grey.shade300,
                                              controller: passwordController,
                                              successColor:
                                                  Colors.green.shade700,
                                              minLength: 8,
                                              uppercaseCharCount: 1,
                                              numericCharCount: 2,
                                              specialCharCount: 1,
                                              normalCharCount: 3,
                                              width: 250,
                                              height: 100,
                                              onSuccess: () {
                                                setState(() {
                                                  success = true;
                                                });
                                              },
                                              onFail: () {
                                                setState(() {
                                                  success = false;
                                                });
                                              },
                                            ),
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
                                            ),
                                            Align(
                                              child: CheckboxListTile(
                                                contentPadding: EdgeInsets
                                                    .zero, // Boşluğu kaldırmak için bu satırı ekledik
                                                title: RichText(
                                                  textAlign: TextAlign.justify,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "By creating an account, you agree to our Conditions of Use and Privacy Notice",
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xffADA4A5),
                                                          fontSize: ResponsiveDesign
                                                                  .getScreenWidth() /
                                                              30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                activeColor:
                                                    const Color(0xff7B6F72),
                                                value: checkedValue,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    checkedValue = newValue!;
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
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

  TextFormField DoctorInputFormFieldDataPicker(
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
            lastDate: DateTime.now());

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

  void selectGender(Gender selectedGender) {
    setState(() {
      genders.forEach((gender) => gender.isSelected = false);
      selectedGender.isSelected = true;
    });
  }

  void signUpProcess(BuildContext context) {
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
            msg: 'please_enter_mail_address_in_the_appropriate_format'.tr(),
            title: 'warning'.tr());
        return;
      }

      if (!Validation().isStrongPassword(DoctorUserPassword)) {
        showAlertDialogInvalidUsernameOrPassword(
            context: context,
            msg: 'password_appropriate_message'.tr(),
            title: 'warning'.tr());
        return;
      }
      if (checkedValue == false) {
        buildSnackError(
            'Accept our Privacy Policy and Term Of Use', context, "");

        return;
      }
      var request = DoctorApi();
      Doctor doctor = Doctor(
          id: 0,
          username: DoctorUserName,
          userlastname: DoctoruserLastName,
          gender: selectedGender, // Seçilen cinsiyeti burada kullanıyoruz
          tc: int.parse(DoctorUserTC),
          dataofBirth: DoctorUserBirtTime,
          employedInstitution: DoctorUserInstitue,
          usermail: DoctorUserMail,
          password: md5.convert(utf8.encode(DoctorUserPassword)).toString(),
          role: "DOCTOR",
          loggedIn: true);
      request.signUp(doctor, context).then((resp) async {
        // debugPrint(resp.body);
        Map<String, dynamic> jsonData = json.decode(resp.body);
        print("res.body : ${resp.body}");
        var respEntity = DataResult.fromJson(jsonData);

        if (respEntity.success) {
          // Simulate a successful registration
          showSignUpResultDialog(context, true);
        } else {
          showSignUpResultDialog(context, false);
        }
      });
    }
  }

  Future<void> showSignUpResultDialog(
      BuildContext context, bool isSuccess) async {
    String title = isSuccess ? 'success'.tr() : 'failed'.tr();
    String subTitle =
        isSuccess ? 'registration_successful'.tr() : 'registration_failed'.tr();
    String msg = isSuccess
        ? 'you_have_successfully_registered'.tr()
        : 'registration_failed_please_try_again'.tr();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 50,
          ),
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subTitle, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(msg),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    if (isSuccess) {
      await Future.delayed(Duration(seconds: 2));

      Navigator.of(context).pop();
    }
  }

  void showAlertDialogInvalidUsernameOrPassword(
      {required BuildContext context,
      required String title,
      required String msg}) {
    showDialog(
        context: context,
        builder: (builder) => CustomAlertDialog.getAlertDialogUserSignUp(
            success: false,
            context: context,
            title: title,
            subTitle: "Failed :",
            msg: msg,
            roleId: 0));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, String size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: 10.w,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
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
