import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/ResponsiveDesign.dart';

class NetworkErrorPage extends StatefulWidget {
  @override
  State<NetworkErrorPage> createState() => NetworkErrorPageState();
}

class NetworkErrorPageState extends State<NetworkErrorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // First LinearLayout with background image
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_login.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/network_no.svg',
                    width: 100,
                    height: 100,
                  ),
                  // TextView with "step_by_step" text
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'oh_no'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'no_internet_connection'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'or_try_again'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 180.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          retryProcess(context);
                        });
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
                      child: Text('retry'.tr(),
                          style: TextStyle(
                              fontSize:
                                  ResponsiveDesign.getScreenWidth() / 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void retryProcess(BuildContext context) {}
}
