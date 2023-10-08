class DataResult {
  bool success;
  String message;
  var data;

  DataResult(
      {required this.success, required this.message, required this.data});

  factory DataResult.fromJson(Map<String, dynamic> json) {
    return DataResult(
        success: json["success"], message: json["message"], data: json["data"]);
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data};
  }

  @override
  String toString() {
    return 'ResponseEntity{success: $success, message: $message, data: $data}';
  }
}
