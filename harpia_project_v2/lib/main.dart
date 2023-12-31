import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harpia_project/theme/theme.dart';
import 'package:harpia_project/utils/Utils.dart';
import 'package:harpia_project/views/network/network_error.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';
import 'package:harpia_project/views/preview.dart';
import 'package:get_storage/get_storage.dart';

ThemeMode appTheme = ThemeMode.dark; // Varsayılan tema

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('tr'),
          Locale('fr'),
          Locale('zh'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool themeMoe = false;
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi

  @override
  void initState() {
    super.initState();
    _checkInternetAndNavigate();
    loadBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    MySharedPreferences.setLocalName(Platform.localeName);

    // Enable immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: selectedBackgroundColor,
      body: Stack(
        children: [
          // First LinearLayout with background image
          Container(
            height: 200,
            decoration: BoxDecoration(
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
                  'assets/images/dikeycizgili.svg',
                  width: 100,
                  height: 100,
                ),
                // TextView with "step_by_step" text
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.sp),
                  child: Text(
                    "step_by_step".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_login.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // Copyright TextView - horizontally centered
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'hakan_aydin'.tr() + " " + DateTime.now().year.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _checkInternetAndNavigate() async {
    bool hasInternet = await checkInternetConnection();
    if (hasInternet) {
      _navigateToLoginPage();
    } else {
      _navigateToNetworkErrorPage();
    }
  }

  void _navigateToLoginPage() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PreviewPage()),
      ),
    );
  }

  void _navigateToNetworkErrorPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NetworkErrorPage()),
    );
  }

  void loadBackgroundColor() async {
    int colorValue = await MySharedPreferences.getBackgroundColor();
    setState(() {
      selectedBackgroundColor = Color(colorValue);
    });
  }
}
