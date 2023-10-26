import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';
import 'package:http/http.dart' as http;

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

      var response =
          await http.put(url, headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
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
}