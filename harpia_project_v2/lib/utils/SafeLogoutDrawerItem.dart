import 'package:flutter/material.dart';

class SafeLogoutDrawerItem extends StatefulWidget {
  // const SafeLogOutUtil({required this.context});
  //
  // final BuildContext context;

  @override
  State<SafeLogoutDrawerItem> createState() => _SafeLogoutDrawerItemState();
}

class _SafeLogoutDrawerItemState extends State<SafeLogoutDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return _buildDrawerListTileSafeLogout(context: context);
  }

  ListTile _buildDrawerListTileSafeLogout({required BuildContext context}) {
    return ListTile(
      title: const Text("Safe Logout"),
      onTap: () {
        setState(() {
          SafeLogOut.clearSharedPref();
          Navigator.of(context).popUntil((route) => route.isFirst);
        });
      },
    );
  }
}

class SafeLogOut {
  static void clearSharedPref() {
    // SharedPref.sp.clear();
  }
}
