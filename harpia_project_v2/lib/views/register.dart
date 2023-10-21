import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harpia_project/views/signuppage/DoctorSignUpPage.dart';
import 'package:harpia_project/views/signuppage/PatientSignUpPage.dart';

enum UserType {
  Doctor,
  Patient,
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();

  List<Widget> pages = [
    DoctorSignUpPage(),
    PatientSignUpPage(),
  ];
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _tcController.dispose();
    _birthDateController.dispose();
    _institutionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            margin: EdgeInsets.only(bottom: 1),
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 4.0,
                    color: Colors
                        .blue), // Indicator çizgisi özelliklerini ayarlayabilirsiniz.
              ),
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    'assets/images/doctor.svg', // Kullanmak istediğiniz SVG dosyasının yolunu buraya ekleyin
                    width: 24,
                    height: 24,
                    color: Colors.black,
                  ),
                  text: 'doctor'.tr(),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    'assets/images/patient.svg', // Kullanmak istediğiniz SVG dosyasının yolunu buraya ekleyin
                    width: 24,
                    height: 24,
                    color: Colors.black,
                  ),
                  text: 'patient'.tr(),
                )
              ],
              unselectedLabelColor: Colors.black,
              labelColor: Colors.blue,
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
