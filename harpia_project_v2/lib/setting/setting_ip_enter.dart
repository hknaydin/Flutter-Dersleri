import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harpia_project/utils/Constant.dart';

import '../core/ResponsiveDesign.dart';
import '../utils/CustomSnackBar.dart';
import '../utils/ProductColor.dart';
import '../utils/my_shared_preferences.dart';

class SettingIpEnter extends StatefulWidget {
  const SettingIpEnter({Key? key}) : super(key: key);

  @override
  SettingIpEnterState createState() => SettingIpEnterState();
}

bool isVisible = false;
bool _isLoginSuccessful = false;

class SettingIpEnterState extends State<SettingIpEnter> {
  TextEditingController tfHospitalName = TextEditingController();
  TextEditingController tfInternalIp = TextEditingController();
  TextEditingController tfExternalIp = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    tfHospitalName.dispose();
    tfInternalIp.dispose();
    tfExternalIp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }

  void loadSharedPreferences() async {
    String hospitalName = await MySharedPreferences.getHospitalName();
    String internalIp = await MySharedPreferences.getHospitalInternalIp();
    String externalIp = await MySharedPreferences.getHospitalExteralIp();

    setState(() {
      tfHospitalName.text = hospitalName;
      tfInternalIp.text = internalIp;
      tfExternalIp.text = externalIp;
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
                              'server_information_panel'.tr(),
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
                                  HospitalNameInputTextField(),
                                  SizedBox(height: 12.h),
                                  InternalIpInputTextField(),
                                  SizedBox(height: 12.h),
                                  ExternalIpInputTextField(),
                                  SaveIpInformation(
                                    formKey: formKey,
                                    tfHospitalName: tfHospitalName,
                                    tfInternalIp: tfInternalIp,
                                    tfExternalIp: tfExternalIp,
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

  Padding HospitalNameInputTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
      child: TextFormField(
        maxLength: Constat.max,
        validator: (data) {
          if (data!.isEmpty) {
            return "enter_hospital_name".tr();
          }

          // return null;
        },
        decoration: InputDecoration(
            prefixIcon: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                'assets/images/categories/ic_domain_red_24dp.svg',
                width: 25, // Genişlik
                height: 25, // Yükseklik
                color: Colors.blue, // Renk
              ),
            ),
            labelText: "facility_name".tr(),
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "facility_name".tr(),
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

  Padding InternalIpInputTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: TextFormField(
        maxLength: Constat.max,
        obscureText: isVisible,
        validator: (data) {
          if (data!.isEmpty) {
            return "enter_ip_address".tr();
          }
          // return null;
        },
        decoration: InputDecoration(
            prefixIcon: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                'assets/images/categories/ic_nature_red_24dp.svg',
                width: 25, // Genişlik
                height: 25, // Yükseklik
                color: Colors.blue, // Renk
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(Icons.visibility)),
            labelText: "internal_ip".tr(),
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "internal_ip".tr(),
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

  Padding ExternalIpInputTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: TextFormField(
        maxLength: Constat.max,
        obscureText: isVisible,
        validator: (data) {
          if (data!.isEmpty) {
            return "enter_ip_address".tr();
          }
          // return null;
        },
        decoration: InputDecoration(
            prefixIcon: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                'assets/images/categories/ic_nature_red_24dp.svg',
                width: 25, // Genişlik
                height: 25, // Yükseklik
                color: Colors.blue, // Renk
              ),
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(Icons.visibility)),
            labelText: "external_ip".tr(),
            labelStyle: TextStyle(
                fontSize: ResponsiveDesign.getScreenWidth() / 23,
                color: ProductColor.black,
                fontWeight: FontWeight.bold),
            hintText: "external_ip".tr(),
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

  SaveIpInformation LoginButtonField() {
    return SaveIpInformation(
      formKey: formKey,
      tfHospitalName: tfHospitalName,
      tfInternalIp: tfInternalIp,
      tfExternalIp: tfExternalIp,
    );
  }
}

class SaveIpInformation extends StatelessWidget {
  final TextEditingController tfHospitalName, tfInternalIp, tfExternalIp;
  GlobalKey<FormState> formKey;

  SaveIpInformation(
      {required this.formKey,
      required this.tfHospitalName,
      required this.tfInternalIp,
      required this.tfExternalIp}); //({super.key /*,required this.screenInfo*/});

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

    String hospitalName = tfHospitalName.text.trim();
    String hospitalInternalIp = tfInternalIp.text.trim();
    String hospitalExternalIp = tfExternalIp.text.trim();
    //showInvalidUsernameOrPassword(msg: hospitalExternalIp, context: context);
  }

  void showInvalidUsernameOrPassword(
      {required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.getSnackBar(msg));
  }
}
