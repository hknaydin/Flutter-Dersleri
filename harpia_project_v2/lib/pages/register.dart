import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGrey extends StatelessWidget {
  static String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
    );
  }
}
