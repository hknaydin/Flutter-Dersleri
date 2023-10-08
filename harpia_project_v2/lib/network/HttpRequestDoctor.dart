import 'dart:convert';

import 'package:harpia_project/utils/MySharedPreferences.dart';

import '../model/user/Doctor.dart';
import '../utils/HttpUtil.dart';
import 'BaseHttpRequest.dart';
import 'package:http/http.dart' as http;

class HttpRequestDoctor {
  static final String _baseUrl = BaseHttpRequestConfig.baseUrl;

  Future<http.Response> signUp(Doctor doctor) async {
    String ip = await MySharedPreferences.getHospitalInternalIp();
    Uri url = Uri.http(ip + ":8080", "/users/register");
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
