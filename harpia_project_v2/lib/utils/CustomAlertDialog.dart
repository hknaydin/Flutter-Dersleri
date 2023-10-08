import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/ResponsiveDesign.dart';

class CustomAlertDialog {
  static AlertDialog getAlertDialogUserSignUp(
      {required BuildContext context,
      required String title,
      required String subTitle,
      required String msg,
      required int roleId,
      required bool success}) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: SizedBox(
        height: ResponsiveDesign.getScreenHeight() / 8,
        width: ResponsiveDesign
            .getScreenWidth(), // İçeriği genişliği tam ekran yapar
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(/*subTitle*/ "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: ResponsiveDesign.getScreenWidth() / 30,
                      color: success ? Colors.green : Colors.red)),
              SizedBox(height: ResponsiveDesign.getScreenHeight() / 30),
              Text(msg,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: ResponsiveDesign.getScreenWidth() / 30))
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              textAlign: TextAlign.justify,
              "Ok",
              style:
                  TextStyle(fontSize: ResponsiveDesign.getScreenWidth() / 20),
            )),
      ],
    );
  }
}
