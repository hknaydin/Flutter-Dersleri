import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/ResponsiveDesign.dart';
import '../loginscreen.dart';

class NetworkErrorPage extends StatefulWidget {
  @override
  State<NetworkErrorPage> createState() => NetworkErrorPageState();
}

class NetworkErrorPageState extends State<NetworkErrorPage> {
  bool isOnline = false;
  bool isButtonEnabled = true;
  bool isLoading = false; // İlerleme çemberinin görünürlüğü

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

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
            // Centered Logo ImageView
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isOnline
                        ? 'assets/images/network_yes.svg'
                        : 'assets/images/network_no.svg',
                    width: 100,
                    height: 100,
                  ),
                  // TextView with "step_by_step" text
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.sp),
                    child: Column(
                      children: [
                        Text(
                          isOnline ? "yes".tr() : "oh_no".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          isOnline
                              ? 'internet_problem_control'.tr()
                              : "no_internet_connection".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          isOnline ? "" : "or_try_again".tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 180.w,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              showLoadingDialog(
                                  context); // İlerleme çemberi göster
                              retryProcess(context);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.sp),
                                        side: BorderSide(color: Colors.pink))),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.pink),
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white)),
                            child: Text('retry'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            // Second LinearLayout with background image (rotated)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Transform.rotate(
                angle: 3.14159, // Rotate 180 degrees (Pi approximation)
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header_login.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            // Copyright TextView - horizontally centered
          ],
        ),
      ),
    );
  }

  Future<void> retryProcess(BuildContext context) async {
    if (!isButtonEnabled) return;

    setState(() {
      isButtonEnabled = false;
      isLoading = true; // İlerleme çemberini göster
    });

    bool isOnlineNow = await checkInternetConnection();

    if (isOnlineNow) {
      setState(() {
        isOnline = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    } else {
      // İnternet bağlantısı yoksa işlem yapma
      setState(() {
        isButtonEnabled = true;
        isLoading = false; // İlerleme çemberini gizle
      });
    }
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading...'),
            ],
          ),
        );
      },
    );

    await Future.delayed(Duration(seconds: 2)); // 2 saniye bekle

    Navigator.of(context).pop(); // AlertDialog'ı kapat
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
