import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harpia_project/model/userrole/userRole.dart';
import 'package:harpia_project/pages/about_project_and_team.dart';
import 'package:harpia_project/pages/register.dart';
import 'package:harpia_project/utils/Validation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/ResponsiveDesign.dart';
import '../model/user/Doctor.dart';
import '../network/HttpRequestDoctor.dart';
import '../setting/setting_admin.dart';
import '../utils/CustomAlertDialog.dart';
import '../utils/MySharedPreferences.dart';
import '../utils/ProductColor.dart';
import '../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => GirisSayfasiState();
}

bool isVisible = true;

class GirisSayfasiState extends State<LoginScreen> {
  GetStorage box = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tfUsername = TextEditingController();
  TextEditingController tfPassword = TextEditingController();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  Icon? selectedIcon;

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
    // İzin kontrolünü başlat
    checkPermissions();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // initState tamamlandıktan sonra çağrılacak
      informationMessage();
    });
    initUserNameAndUserPassword();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const About()),
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
                MaterialPageRoute(builder: (context) => const SettingAdmin()),
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
                    const LoginPageLogo(),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: UserNameInputFormField(
                          tfUsername,
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          'name',
                          'enter_your_name',
                          'please_enter_your_first_name',
                          TextInputType.text),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: PasswordInputFormField(
                          tfPassword,
                          Icon(
                            Icons.password_outlined,
                            color: Colors.blue,
                          ),
                          'prompt_password',
                          'please_enter_the_password',
                          'please_enter_password_that_is_difficult_to_guess',
                          TextInputType.text),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 180.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            signinProcess(context);
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.sp),
                                    side: BorderSide(color: Colors.pink))),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.pink),
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white)),
                        child: Text('login'.tr(),
                            style: TextStyle(
                                fontSize:
                                    ResponsiveDesign.getScreenWidth() / 20)),
                      ),
                    ),
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
                              child: GestureDetector(
                                onTap: () {
                                  // Kayıt sayfasına yönlendirme işlemi
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                                },
                                child: Text(
                                  "sign_up_now".tr(),
                                  style: GoogleFonts.quicksand(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    otherMethodField(),
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

  Row otherMethodField() {
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
          Expanded(flex: 3, child: SizedBox()),
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                child: Align(
                  alignment: Alignment
                      .topCenter, // Burada Alignment.topCenter kullanıyoruz
                  child: DropdownButton<Icon>(
                    value: selectedIcon,
                    elevation: 1,
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
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> signinProcess(BuildContext context) async {
    bool controlResult = formKey.currentState!.validate();
    String userMail = tfUsername.text;
    String userPassword = tfPassword.text;
    if (controlResult) {
      if (!Validation().isEmailValid(userMail)) {
        showAlertDialogInvalidUsernameOrPassword(
            context: context,
            msg: 'please_enter_mail_address_in_the_appropriate_format'.tr(),
            title: 'warning'.tr());
        return;
      }
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      if (hospitalInternalIp != "empty") {
        MySharedPreferences.setLoginUserName(userMail);
        MySharedPreferences.setLoginUserPassword(userPassword);

        // Progres çubuğunu göster
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0),
                    Text('signing'.tr()),
                  ],
                ),
              ),
            );
          },
        );

        // Backend tarafından cevap gelene kadar bekleyin
        await performLogin(userMail, userPassword, context);

        // Progres çubuğunu kaldır
        // Navigator.of(context).pop();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content:
                  Text('please_enter_the_hospital_internal_ip_address'.tr()),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
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

  TextFormField UserNameInputFormField(
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

  TextFormField PasswordInputFormField(
      TextEditingController controller,
      Icon icon,
      String lblTxt,
      String lblHintTxt,
      String returnMessage,
      TextInputType keyboardType) {
    return TextFormField(
      controller: controller,
      obscureText: isVisible,
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

  Future<void> checkPermissions() async {
    final locationStatus = await Permission.location.status;
    final bleScanStatus = await Permission.bluetoothScan.status;
    final bleConnectStatus = await Permission.bluetoothConnect.status;
    // Location permission
    if (locationStatus.isDenied) {
      await Permission.location.request();
    }

    // Bluetooth scanning permission
    if (bleScanStatus.isDenied) {
      await Permission.bluetoothScan.request();
    }

    // Bluetooth connection permission
    if (bleConnectStatus.isDenied) {
      await Permission.bluetoothConnect.request();
    }
  }

  void informationMessage() {
    final snackBar = SnackBar(
      content: Expanded(
        child: Row(
          children: [
            SvgPicture.asset('assets/images/ic_dikey_1.svg',
                width: 24, height: 24),
            SizedBox(
              width: 15.w,
            ), // Resim ekleyin
            Expanded(
              child: Column(
                children: [
                  Text(
                      textAlign: TextAlign.justify,
                      'tedavi_icin_degil'.tr(),
                      style: TextStyle(
                          fontSize: ResponsiveDesign.getScreenWidth() / 25,
                          fontWeight: FontWeight.bold)),
                  Text(
                      textAlign: TextAlign.justify,
                      'bu_uygulamada_sunulan'.tr(),
                      style: TextStyle(
                          fontSize: ResponsiveDesign.getScreenWidth() / 30)),
                ],
              ),
            ),
          ],
        ),
      ),
      action: SnackBarAction(
        label: 'Kapat',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 10), // Süre tanımlaması
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar)
        .closed
        .then((SnackBarClosedReason reason) {
      if (reason == SnackBarClosedReason.action) {
        // Kullanıcı Kapat eylemini tıkladı
        // İstediğiniz bir işlemi gerçekleştirebilirsiniz
      } else if (reason == SnackBarClosedReason.timeout) {
        // Zaman aşımı nedeniyle SnackBar otomatik olarak kapandı
        // İstediğiniz bir işlemi gerçekleştirebilirsiniz
      }
    });
  }

  Future<void> initUserNameAndUserPassword() async {
    if (MySharedPreferences.getAdminUserName() != "empty") {
      tfUsername.text = await MySharedPreferences.getLoginUserName();
    }
    if (MySharedPreferences.getAdminUserName() != "empty") {
      tfPassword.text = await MySharedPreferences.getLoginUserPassword();
    }
  }
}

Future<void> performLogin(
    String userMail, String userPassword, BuildContext context) async {
  var request = HttpRequestDoctor();

  String userRole = await request.getRole(userMail, userPassword);

  Navigator.of(context).pop();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('warning'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('login_successful'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
  await Future.delayed(const Duration(seconds: 2));

  Navigator.of(context).pop();
  // Role göre işlem yapılabilir
  // Örnek olarak:
  if (userRole == UserRole.ADMIN.roleName) {
    login(UserRole.ADMIN.roleName, userMail, userPassword);
  } else if (userRole == UserRole.DOCTOR.roleName) {
    login(UserRole.DOCTOR.roleName, userMail, userPassword);
  } else if (userRole == UserRole.PATIENT.roleName) {
    login(UserRole.PATIENT.roleName, userMail, userPassword);
  }
}

Future<void> login(
    String roleName, String userMail, String userPassword) async {
  var request = HttpRequestDoctor();
  if (roleName == UserRole.DOCTOR.roleName) {
    Doctor doctor = Doctor(
        0,
        "userName",
        "userLastName",
        "gender", // Seçilen cinsiyeti burada kullanıyoruz
        111111111,
        "10.10.1991",
        "ktu",
        userMail,
        md5.convert(utf8.encode(userPassword)).toString(),
        roleName,
        true);

    await request.loginDr(doctor);
  }
}

Future<dynamic> showDialogFunction(
    BuildContext context, String userRole) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('warning'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(userRole,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
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
