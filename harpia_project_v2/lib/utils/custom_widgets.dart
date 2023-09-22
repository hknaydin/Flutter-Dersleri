import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: NewWidget(color, icon, iconColor), //
    );
  }
}

class NewWidget extends StatelessWidget {
  final dynamic color;
  final dynamic icon;
  final dynamic iconColor;
  const NewWidget(this.color, this.icon, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 12.sp,
        ));
  }
}
