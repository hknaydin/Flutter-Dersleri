import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harpia_project/views/doctorpages/doctornavigator/DrSettings.dart';

import '../../views/doctorpages/doctornavigator/DrAboutDevice.dart';
import '../../views/doctorpages/doctornavigator/DrSharePage.dart';
import '../../views/faq.dart';
import '../../views/harpia_about.dart';
import '../../views/loginscreen.dart';
import '../component/custom_list_tile.dart';
import '../component/header.dart';

class PatientDrawer extends StatefulWidget {
  const PatientDrawer({Key? key}) : super(key: key);

  @override
  State<PatientDrawer> createState() => MainDrawerState();
}

class MainDrawerState extends State<PatientDrawer> {
  // var pageList = [const PatientProfile()];
  bool _isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 250 : 100,
        margin: const EdgeInsets.only(bottom: 0, top: 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(25, 25, 25, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                title: 'settings'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                            builder: (context) => DoctorSetting()),
                      )
                      .then((value) => (value) {
                            setState(() {});
                          });
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.app_blocking_outlined,
                title: 'about_device'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                            builder: (context) => DoctorAboutDevice()),
                      )
                      .then((value) => (value) {
                            setState(() {});
                          });
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.bug_report,
                title: 'report_bug'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.question_mark_outlined,
                title: 's.s.s'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(builder: (context) => FaqScreen()),
                      )
                      .then((value) => (value) {
                            setState(() {});
                          });
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.share,
                title: 'share'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  Fluttertoast.showToast(
                      msg: "This is DoctorSharePage",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                            builder: (context) => DoctorSharePage()),
                      )
                      .then((value) => (value) {
                            setState(() {});
                          });
                },
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.app_shortcut,
                title: 'Harpia',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(builder: (context) => HarpiaAbout()),
                      )
                      .then((value) => (value) {
                            setState(() {});
                          });
                },
              ),
              const Divider(color: Colors.grey),
              SizedBox(height: 10.h),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.logout,
                title: 'logout'.tr(),
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
                onTap: () {
                  logout(); // Logout fonksiyonunu çağırır},
                },
              ),
              const Spacer(),
              const SizedBox(height: 10),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }
}
