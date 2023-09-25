import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harpia_project/pages/about_project_and_team.dart';
import 'package:harpia_project/utils/my_shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../core/ResponsiveDesign.dart';
import '../setting/setting_admin.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ProductColor.dart';
import '../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => GirisSayfasiState();
}

bool isVisible = false;

class GirisSayfasiState extends State<LoginScreen> {
  GetStorage box = GetStorage();
  var formKey = GlobalKey<FormState>();
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  Icon? selectedIcon;
  final List<Map> _myJson = [
    {"id": '1', "image": "assets/images/countries/flag_tr.png"},
    {"id": '2', "image": "assets/images/countries/flag_australia.png"},
    {"id": '3', "image": "assets/images/countries/flag_france.png"},
    {"id": '4', "image": "assets/images/countries/flag_china.png"},
  ];

  TextEditingController tfUsername = TextEditingController();
  TextEditingController tfPassword = TextEditingController();

  List<List> diller = [
    ["tr", "Türkçe"],
    ["en", "English"],
    ["zh", "Çince"],
    ["fr", "Fransızca"],
  ];
  /*void checkVersion() async {
    _checker.checkUpdate().then((value) {
      currentVersion = value.currentVersion;
    });
  }*/

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get Local Name with SharedPreferences
    MySharedPreferences.getLocalName().then((value) {
      print("SharedPref Locale Name : >> " + value);
    });

    ResponsiveDesign(mediaQueryData: MediaQuery.of(context));

    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            heroTag: null,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/ic_questions.svg',
                width: 35.sp,
                height: 35.sp,
              ),
            ),
          ),
          SizedBox(
            height: 1.sp,
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingAdmin()),
              );
            },
            heroTag: null,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/ic_settings.svg',
                width: 35.sp,
                height: 35.sp,
              ),
            ),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(children: [
            topField(),
            Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginPageLogo(),
                    SizedBox(
                      height: 5.sp,
                    ),
                    UserNameInputField(),
                    PasswordInputField(),
                    SizedBox(
                      height: 5.h,
                    ),
                    LoginButtonField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 3.sp,
                      child: Container(
                        color: const Color.fromARGB(255, 200, 200, 200),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: Row(
                        children: [
                          Text("not_registered_yet".tr(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "sign_up_now".tr(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    OtherMethodField(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Yatayda ortalamak için bu satırı ekleyin
                        children: [
                          CustomWidgets.socialButtonCircle(
                              ProductColor().facebookColor,
                              FontAwesomeIcons.facebookF,
                              iconColor: Colors.white,
                              onTap: () {}),
                          SizedBox(
                            width: 20.h,
                          ),
                          CustomWidgets.socialButtonCircle(
                              ProductColor().googleColor,
                              FontAwesomeIcons.googlePlusG,
                              iconColor: Colors.white,
                              onTap: () {}),
                        ]),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Row OtherMethodField() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 1.sp,
              child: Container(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            )),
        Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "use_other_methods".tr(),
                  style: GoogleFonts.quicksand(
                      fontSize: 10.sp, fontWeight: FontWeight.bold),
                ))),
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 1.sp,
              child: Container(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ))
      ],
    );
  }

  LoginButton LoginButtonField() {
    return LoginButton(
      formKey: formKey,
      tfUsername: tfUsername,
      tfPassword: tfPassword,
    );
  }

  Container topField() {
    return Container(
      width: 300.w,
      height: 150.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/header_login.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "v${_packageInfo.version}",
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Expanded(flex: 3, child: Container()),
          Expanded(
              flex: 1,
              child: DropdownButton<Icon>(
                value: selectedIcon,
                elevation: 0,
                isDense: false,
                onChanged: (Icon? newValue) {
                  selectedIcon = newValue;
                },
                items: [
                  DropdownMenuItem(
                    value: Icon(Icons.flag),
                    child: Row(
                      children: [
                        Icon(Icons.flag),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icon(Icons.star),
                    child: Row(
                      children: [
                        Icon(Icons.star),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icon(Icons.favorite),
                    child: Row(
                      children: [
                        Icon(Icons.favorite),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Padding UserNameInputField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      child: TextFormField(
        maxLength: _TextFieldInputLength.max,
        validator: (data) {
          if (data!.isEmpty) {
            return "Please enter password";
          }
          if (data.length < _TextFieldInputLength.min) {
            return "Please enter ${_TextFieldInputLength.min} or more  character";
          }
          if (data.length > _TextFieldInputLength.max) {
            return "Please enter ${_TextFieldInputLength.max} or less  character";
          }
          // return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            labelText: "UserName",
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "UserName",
            hintStyle:
                TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: ProductColor.darkBlue)),
            filled: true,
            fillColor: ProductColor.white,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        style: TextStyle(
            fontSize: ResponsiveDesign.getScreenWidth() / 22,
            color: ProductColor.darkBlue),
      ),
    );
  }

  Padding PasswordInputField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: TextFormField(
        maxLength: _TextFieldInputLength.max,
        obscureText: isVisible,
        validator: (data) {
          if (data!.isEmpty) {
            return "Please enter password";
          }
          if (data.length < _TextFieldInputLength.min) {
            return "Please enter ${_TextFieldInputLength.min} or more  character";
          }
          if (data.length > _TextFieldInputLength.max) {
            return "Please enter ${_TextFieldInputLength.max} or less  character";
          }
          // return null;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.blue,
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(Icons.visibility)),
            labelText: "Password",
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "Password",
            hintStyle:
                TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: ProductColor.darkBlue)),
            filled: true,
            fillColor: ProductColor.white,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
        style: TextStyle(
            fontSize: ResponsiveDesign.getScreenWidth() / 22,
            color: ProductColor.darkBlue),
      ),
    );
  }
}

class LoginPageLogo extends StatelessWidget {
  const LoginPageLogo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: SvgPicture.asset(
        'assets/images/ic_dikey_1.svg',
        width: 50,
        height: 50,
      ),
    );
  }
}

class UsernameInputTextField extends StatelessWidget {
  final TextEditingController controller;

  UsernameInputTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return InputTextFieldPadding(
      widget: InputTextFormField(
        hint: "Username",
        state: 1,
        textEditController: controller,
        obscureText: false,
      ),
    );
  }
}

class InputTextFieldPadding extends StatelessWidget {
  final StatelessWidget widget;

  const InputTextFieldPadding({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: ResponsiveDesign.getScreenWidth() / 30,
          right: ResponsiveDesign.getScreenWidth() / 30,
          bottom: ResponsiveDesign.getScreenWidth() / 25),
      child: widget,
    );
  }
}

class InputTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditController;
  final bool obscureText;
  final int state;

  const InputTextFormField(
      {required this.hint,
      required this.state,
      required this.textEditController,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: _TextFieldInputLength.max,
      controller: textEditController,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "Please enter $hint";
        }
        if (data.length < _TextFieldInputLength.min) {
          return "Please enter ${_TextFieldInputLength.min} or more  character";
        }
        if (data.length > _TextFieldInputLength.max) {
          return "Please enter ${_TextFieldInputLength.max} or less  character";
        }
        // return null;
      },
      decoration: InputDecoration(
          prefixIcon: state == 1
              ? Icon(
                  Icons.person,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
          suffixIcon: state == 0
              ? GestureDetector(onTap: () {}, child: Icon(Icons.visibility))
              : null,
          labelText: hint,
          labelStyle: TextStyle(
              fontSize: ResponsiveDesign.getScreenWidth() / 23,
              color: ProductColor.black,
              fontWeight: FontWeight.bold),
          hintText: hint,
          hintStyle:
              TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ProductColor.darkBlue)),
          filled: true,
          fillColor: ProductColor.white,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      style: TextStyle(
          fontSize: ResponsiveDesign.getScreenWidth() / 22,
          color: ProductColor.darkBlue),
    );
  }
}

class PasswordInputTextField extends StatelessWidget {
  final TextEditingController controller;

  PasswordInputTextField(
      {required this.controller}); //({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputTextFieldPadding(
        widget: InputTextFormField(
      state: 0,
      hint: "Password",
      textEditController: controller,
      obscureText: isVisible,
    ));
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController tfUsername, tfPassword;
  GlobalKey<FormState> formKey;

  LoginButton(
      {required this.formKey,
      required this.tfUsername,
      required this.tfPassword}); //({super.key /*,required this.screenInfo*/});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 50.h,
        child: ElevatedButton(
            onPressed: () {
              loginProcess(context);
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.sp),
                        side: BorderSide(color: Colors.pink))),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.pink),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white)),
            child: Text('login'.tr(),
                style: TextStyle(
                    fontSize: ResponsiveDesign.getScreenWidth() / 20))));
  }

  void loginProcess(BuildContext context) async {
    bool controlResult = formKey.currentState!.validate();
    showInvalidUsernameOrPassword(context: context, msg: "error");
  }

  void showInvalidUsernameOrPassword(
      {required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.getSnackBar(msg));
  }
}

class _TextFieldInputLength {
  static int min = 6;
  static int max = 20;
}
