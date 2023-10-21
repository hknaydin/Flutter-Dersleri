import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: success ? Colors.green : Colors.red,
          title: Column(
            children: [
              Text(
                "Password Validation",
                style: GoogleFonts.mPlus1(fontWeight: FontWeight.w500),
              ),
              Text(
                "@CodeWithFlexZ",
                style: GoogleFonts.mPlus1(
                    color: Colors.white54,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 440,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 207, 207, 207),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5)),
                                floatingLabelStyle: GoogleFonts.mPlus1(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          success ? Colors.green : Colors.red,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Password",
                                hintStyle:
                                    GoogleFonts.mPlus1(color: Colors.black),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide()))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FlutterPwValidator(
                        defaultColor: Colors.grey.shade300,
                        controller: controller,
                        successColor: Colors.green.shade700,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 3,
                        width: 250,
                        height: 50,
                        onSuccess: () {
                          setState(() {
                            success = true;
                          });
                        },
                        onFail: () {
                          setState(() {
                            success = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
