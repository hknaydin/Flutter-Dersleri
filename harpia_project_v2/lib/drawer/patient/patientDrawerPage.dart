import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/SafeLogoutDrawerItem.dart';

class PatientDrawer extends StatefulWidget {
  const PatientDrawer({Key? key}) : super(key: key);

  @override
  State<PatientDrawer> createState() => MainDrawerState();
}

class MainDrawerState extends State<PatientDrawer> {
  // var pageList = [const PatientProfile()];
  int selectedIndex = 0;
  Widget getUserDrawer() {
    return Drawer(
      width: 200.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Text("Patient Drawer Header")),
          _buildDrawerListTile(
              context: context, title: "HomePage", selectedIndex: 0),
          _buildDrawerListTile(
              context: context, title: "Profile", selectedIndex: 1),
          SafeLogoutDrawerItem(),
        ],
      ),
    );
  }

  ListTile _buildDrawerListTile(
      {required BuildContext context,
      required String title,
      required int selectedIndex}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        //context.read<DrawerCubit>().updateBody(pageList[selectedIndex]);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return getUserDrawer();
  }
}
