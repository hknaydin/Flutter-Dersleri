import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // First LinearLayout with background image
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header_login.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Centered Logo ImageView
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Image.asset(
                'assets/images/logo.png', // Replace with your logo image path
                width: 150,
                height: 150,
              ),
            ),
          ),
          // TextView with "step_by_step" text
          Center(
            child: Text(
              'step_by_step',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
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
                height: 150,
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
              padding: EdgeInsets.all(8.0),
              child: Text(
                'hakan_aydin',
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
}
