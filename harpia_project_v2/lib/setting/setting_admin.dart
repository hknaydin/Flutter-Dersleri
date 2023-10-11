import 'dart:async';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:harpia_project/setting/setting_ip_enter.dart';
import 'package:harpia_project/utils/Constant.dart';

import '../core/ResponsiveDesign.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ProductColor.dart';
import '../utils/MySharedPreferences.dart';

class SettingAdmin extends StatefulWidget {
  const SettingAdmin({Key? key}) : super(key: key);

  @override
  SettingAdminState createState() => SettingAdminState();
}

bool isVisible = true;
bool _isLoginSuccessful = false;
String username = "", password = "";

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
    // SharedPreferences'i başlat
    loadSharedPreferences();
  }

  void loadSharedPreferences() async {
    String adminUserName = await MySharedPreferences.getAdminUserName();
    String adminUserPassword = await MySharedPreferences.getAdminUserPassword();

    print("Admin UserName: $adminUserName");
    print("Admin UserPassword: $adminUserPassword");

    setState(() {
      tfUsername.text = adminUserName;
      tfPassword.text = adminUserPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1, // İlk satırın boyutu
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_login.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3, // Form ekranının boyutu
            child: SingleChildScrollView(
              // Ekran küçüldüğünde kaydırma işlemi için yeni SingleChildScrollView ekledik.
              child: Center(
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
                                  left: 5.w, right: 5.w, top: 5.w),
                              child: Column(
                                children: [
                                  UserNameInputField(tfUsername),
                                  SizedBox(height: 12.h),
                                  PasswordInputField(tfPassword),
                                  LoginButtonField(),
                                  SizedBox(height: 20.h),
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
          ),
          Expanded(
            flex: 1, //
            child: Transform.rotate(
              // İlk satırın boyutu
              angle: 3.14159, // Rotate 180 degrees (Pi approximation)
              child: Container(
                decoration: const BoxDecoration(
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
    );
  }

  Padding UserNameInputField(TextEditingController? tfUsername) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      child: TextFormField(
        controller: tfUsername,
        maxLength: Constat.max,
        validator: (data) {
          if (data!.isEmpty) {
            return "username_is_required".tr();
          }
          // return null;
        },
        onSaved: (newValue) {
          username = newValue!;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            labelText: "prompt_email".tr(),
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "prompt_email".tr(),
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

  Padding PasswordInputField(TextEditingController tfPassword) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: TextFormField(
        controller: tfPassword,
        maxLength: Constat.max,
        obscureText: isVisible,
        validator: (data) {
          if (data!.isEmpty) {
            return "password_is_required".tr();
          }
          // return null;
        },
        onSaved: (newValue) {
          password = newValue!;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20.0, // İkon boyutunu belirle
              color: Colors.blue,
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child:
                    Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
            labelText: "password".tr(),
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "password".tr(),
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

  LoginButton LoginButtonField() {
    return LoginButton(
      formKey: formKey,
      tfUsername: tfUsername,
      tfPassword: tfPassword,
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
        width: 100.w,
        height: 50.h,
        child: ElevatedButton(
            onPressed: () {
              formKey.currentState!
                  .save(); // Form içindeki onSave metotlarını çağırır.
              print("username: " + username);
              print("pass: " + password);
              loginProcess(context, username, password);
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

  Future<void> loginProcess(
      BuildContext context, String username, String password) async {
    bool controlResult = formKey.currentState!.validate();

    print("username: " + username);
    print("pass: " + password);

    if (username == "admin" && password == "1234") {
      showInvalidUsernameOrPassword(
          context: context, msg: "login_successful".tr());
      MySharedPreferences.setAdminUserName(username);
      MySharedPreferences.setAdminUserPassword(password);
      // Delayed navigation to the next page
      await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SettingIpEnter()));
    } else {
      showInvalidUsernameOrPassword(
          context: context, msg: "username_or_password_error".tr());
    }
  }

  void showInvalidUsernameOrPassword(
      {required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.getSnackBar(msg));
  }
}
