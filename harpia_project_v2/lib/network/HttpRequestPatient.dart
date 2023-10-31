import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';
import 'package:http/http.dart' as http;

import '../model/patientGlikoz/PatientGlikozValues.dart';

class PatientApi {
  Future<http.Response> setPatientHipoAndHiperValue(
      BuildContext context,
      int patientId,
      int paramGlobalHipoGlisemi,
      int paramGlobalHiperGlisemi) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      Map<String, dynamic> requestData = {
        "id": patientId.toString(),
        "hipo_glisemi": paramGlobalHipoGlisemi.toString(),
        "hiper_glisemi": paramGlobalHiperGlisemi.toString(),
      };
      Uri url = Uri.parse(
              'http://$hospitalInternalIp:8080/users/set_patient_hipo_hiper_value')
          .replace(queryParameters: requestData);

      var response = await http
          .put(url, headers: {'Content-Type': 'application/json'}).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          // Zaman aşımı hatası durumunda toast mesajı görüntüle
          Fluttertoast.showToast(
            msg: 'Zaman aşımı! İstek tamamlanamadı.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          throw TimeoutException('Zaman aşımı! İstek tamamlanamadı.');
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        return response;
      } else {
        // İstek başarısız olduysa hata mesajını alın
        var errorMessage = response.body;
        throw Exception('Login error: $errorMessage');
      }
    } catch (error) {
      throw Exception('An error occurred while performing login: $error');
    }
  }

  Future<http.Response> setPatientSensorPeriod(
      int patientId, int patientSensorMeasurementPeriod) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      Map<String, dynamic> requestData = {
        "id": patientId.toString(),
        "sensor_period": patientSensorMeasurementPeriod.toString(),
      };
      Uri url = Uri.parse(
              'http://$hospitalInternalIp:8080/users/set_patient_sensor_period')
          .replace(queryParameters: requestData);

      var response = await http
          .put(url, headers: {'Content-Type': 'application/json'}).timeout(
        Duration(seconds: 5),
        onTimeout: () {
          // Zaman aşımı hatası durumunda toast mesajı görüntüle
          Fluttertoast.showToast(
            msg: 'Zaman aşımı! İstek tamamlanamadı.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          throw TimeoutException('Zaman aşımı! İstek tamamlanamadı.');
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        return response;
      } else {
        // İstek başarısız olduysa hata mesajını alın
        var errorMessage = response.body;
        throw Exception('Login error: $errorMessage');
      }
    } catch (error) {
      throw Exception('An error occurred while performing login: $error');
    }
  }

  Future<List<PatientGlikozValues>> getPatientGlikozValues(
      int patientId) async {
    try {
      // Kullanıcı adı ve şifreyi kullanarak backend'e istek gönderin
      String hospitalInternalIp =
          await MySharedPreferences.getHospitalInternalIp();

      Map<String, dynamic> requestData = {
        "patient_id": patientId.toString(),
      };

      Uri url = Uri.parse(
              'http://$hospitalInternalIp:8080/users/get_patient_glikoz_Values')
          .replace(queryParameters: requestData);

      var response = await http
          .post(url,
              headers: {'Content-Type': 'application/json; charset=utf-8'},
              body: jsonEncode(requestData))
          .timeout(
        Duration(seconds: 10),
        onTimeout: () {
          // Zaman aşımı hatası durumunda toast mesajı görüntüle
          Fluttertoast.showToast(
            msg: 'Zaman aşımı! İstek tamamlanamadı.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          throw TimeoutException('Zaman aşımı! İstek tamamlanamadı.');
        },
      );

      print('resp : $response');
      print('resp.body : ${jsonDecode(utf8.decode(response.bodyBytes))}');

      if (response.statusCode == HttpStatus.ok) {
        // İstek başarılı olduysa rolü alın
        var responseData = response.body;

        List<dynamic> jsonList =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];

        List<PatientGlikozValues> patientsFromDoctor =
            PatientGlikozValues.fromMap(jsonList);

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
