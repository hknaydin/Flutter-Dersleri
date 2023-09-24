import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/ResponsiveDesign.dart';
import 'ProductColor.dart';

class CustomSnackBar {
  // static ScaffoldMessenger getScaffoldMessenger(BuildContext context, String text) {
  //   return ScaffoldMessenger.of(context).showSnackBar(getSnackBar(text));
  //
  // }
  // static void showScaffoldMessage(
  //     {required BuildContext context, required String msg}) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(getSnackBar(msg));
  // }

  static SnackBar getSnackBar(String msg) {
    return SnackBar(
      content: Row(
        children: [
          SvgPicture.asset(
            'assets/images/ic_dikey.svg', // SVG dosyasının yolunu buraya girin
            width: 30,
            height: 30,
            color: ProductColor.redAccent,
          ),
          SizedBox(width: 8.sp), // İkon ile metin arasına boşluk eklemek için
          Text(
            msg,
            style: TextStyle(
              color: ProductColor.white,
              fontSize: ResponsiveDesign.getScreenWidth() / 27,
            ),
          ),
        ],
      ),
      closeIconColor: ProductColor.white,
      showCloseIcon: true,
      backgroundColor: ProductColor.black,
      duration: Duration(seconds: 5),
    );
  }
}
