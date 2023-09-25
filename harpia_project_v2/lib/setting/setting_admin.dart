import 'dart:html';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/utils/Constant.dart';

import '../core/ResponsiveDesign.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ProductColor.dart';
import '../utils/my_shared_preferences.dart';

class SettingAdmin extends StatefulWidget {
  const SettingAdmin({Key? key}) : super(key: key);

  @override
  SettingAdminState createState() => SettingAdminState();
}

bool isVisible = false;
bool _isLoginSuccessful = false;

class SettingAdminState extends State<SettingAdmin> {
  TextEditingController tfUsername = TextEditingController();
  TextEditingController tfPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    tfUsername.dispose();
    tfPassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }

  void loadSharedPreferences() async {
    String username = await MySharedPreferences.getAdminUserName();
    String password = await MySharedPreferences.getAdminUserPassword();

    setState(() {
      tfUsername.text = username;
      tfPassword.text = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_login.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().statusBarHeight),
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
                        child: Column(
                          children: [
                            SizedBox(height: 12.h),
                            Text(
                              'admin_panel'.tr(),
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
                              padding: EdgeInsets.only(
                                  left: 16.w, right: 16.w, top: 5.w),
                              child: Column(
                                children: [
                                  UsernameInputTextField(
                                      controller: tfUsername),
                                  SizedBox(height: 12.h),
                                  PasswordInputTextField(
                                    controller: tfPassword,
                                  ),
                                  LoginButton(
                                    formKey: formKey,
                                    tfUsername: tfUsername,
                                    tfPassword: tfPassword,
                                  ),
                                  SizedBox(height: 16.h),
                                  if (_isLoginSuccessful)
                                    Text(
                                      "login_successful".tr(),
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: 3.14159, // Rotate 180 degrees (Pi approximation)
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header_login.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
        textEditController: controller,
        obscureText: false,
        type: true,
      ),
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
      hint: "Password",
      textEditController: controller,
      obscureText: true,
      type: false,
    ));
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
  final bool type;

  const InputTextFormField(
      {required this.hint,
      required this.textEditController,
      required this.obscureText,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: Constat.max,
      controller: textEditController,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "Please enter $hint";
        }
        // return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            type == true ? Icons.person : Icons.lock,
            color: Colors.blue,
          ),
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
        width: ResponsiveDesign.getScreenWidth() / 1.5,
        height: ResponsiveDesign.getScreenHeight() / 15,
        child: ElevatedButton(
            onPressed: () {
              loginProcess(context);
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.pink),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white)),
            child: Text("login",
                style: TextStyle(
                    fontSize: ResponsiveDesign.getScreenWidth() / 20))));
  }

  void loginProcess(BuildContext context) async {
    bool controlResult = formKey.currentState!.validate();
    String username = tfUsername.text.trim();
    String password = tfPassword.text.trim();

    if (controlResult && username == "admin" && password == "1234") {
      showInvalidUsernameOrPassword(
          context: context, msg: "login_successful".tr());
      MySharedPreferences.setAdminUserName(username);
      MySharedPreferences.setAdminUserPassword(password);
    }
  }

  void showInvalidUsernameOrPassword(
      {required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.getSnackBar(msg));
  }
}
