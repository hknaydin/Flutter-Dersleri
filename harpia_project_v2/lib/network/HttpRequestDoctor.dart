import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';

import '../model/user/Doctor.dart';
import 'package:http/http.dart' as http;

import '../model/user/Patient.dart';

class DoctorApi {
  Future<http.Response> signUp(Doctor doctor, BuildContext context) async {
    String hospitalInternalIp =
        await MySharedPreferences.getHospitalInternalIp();
    if (hospitalInternalIp == "empty") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('please_enter_the_hospital_internal_ip_address'.tr()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return Future<http.Response>.value(null);
    } else {
      Uri url = Uri.http("$hospitalInternalIp:8080", "/users/register");
      print("URL : $url");
      Map<String, dynamic> requestData = doctor.toJson();
      print("to json  $requestData");
      var resp = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestData));
      print('requestData : $requestData');
      print('resp : $resp');
      print('resp.body : ${resp.body}');
      return resp;
    }
  }

  Future<String> getRole(String usermail, String userPassword) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      // Şifreyi MD5 formatında hashleyin
      var bytes = utf8.encode(userPassword);
      var password = md5.convert(bytes).toString();
      Map<String, dynamic> requestData = {
        "usermail": usermail,
        "password": password,
      };
      Uri url = Uri.parse('http://$hospitalInternalIp:8080/users/get_role')
          .replace(queryParameters: requestData);

      var response =
          await http.post(url, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        // İstek başarılı olduysa rolü alın
        var responseData = jsonDecode(utf8.decode(response.bodyBytes));
        String role = responseData;

        // Rolü geri döndürün
        return role;
      } else {
        // İstek başarısız olduysa hata mesajını alın
        var errorMessage = response.body;
        throw Exception('Login error: $errorMessage');
      }
    } catch (error) {
      throw Exception('An error occurred while performing login: $error');
    }
  }

  Future<Map<String, dynamic>> loginDr(Doctor doctor) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();
      Uri url = Uri.http("$hospitalInternalIp:8080", "/users/login");

      Map<String, dynamic> requestData = doctor.toJson();
      print("to json  $requestData");
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode(requestData));
      print('requestData : $requestData');

      print('resp : $response');
      print('resp.body : ${jsonDecode(utf8.decode(response.bodyBytes))}');

      if (response.statusCode == 200) {
        // İstek başarılı olduysa rolü alın
        var responseData = jsonDecode(utf8.decode(response.bodyBytes));

        // Rolü geri döndürün
        return responseData;
      } else {
        // İstek başarısız olduysa hata mesajını alın
        var errorMessage = response.body;
        throw Exception('Login error: $errorMessage');
      }
    } catch (error) {
      throw Exception('An error occurred while performing login: $error');
    }
  }

  Future<List<Patient>> getPatientListForDoctor(String userMail) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      Map<String, dynamic> requestData = {
        "usermail": userMail,
      };

      Uri url = Uri.parse('http://$hospitalInternalIp:8080/users/getPatient')
          .replace(queryParameters: requestData);

      var response = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: jsonEncode(requestData));

      print('resp : $response');
      print('resp.body : ${jsonDecode(utf8.decode(response.bodyBytes))}');

      if (response.statusCode == 200) {
        // İstek başarılı olduysa rolü alın
        var responseData = response.body;

        List<dynamic> jsonList =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];

        List<Patient> patientsFromDoctor = Patient.fromMap(jsonList);

        return patientsFromDoctor;
      } else {
        // İstek başarısız olduysa hata mesajını alın
        var errorMessage = response.body;
        throw Exception('Login error: $errorMessage');
      }
    } catch (error) {
      throw Exception('An error occurred while performing login: $error');
    }
  }
}
