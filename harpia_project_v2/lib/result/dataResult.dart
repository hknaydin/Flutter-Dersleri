import 'package:harpia_project/result/result.dart';

class DataResult {
  bool success;
  String message;
  Status? status;
  var data;

  DataResult(
      {required this.success,
      required this.message,
      required this.status,
      required this.data});

  factory DataResult.fromJson(Map<String, dynamic> json) {
    return DataResult(
        success: json["success"],
        message: json["message"],
        status: json["Status"],
        data: json["data"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'status': status,
      'data': data
    };
  }

  @override
  String toString() {
    return 'ResponseEntity{success: $success, message: $message, Status: $status, data: $data}';
  }
}
