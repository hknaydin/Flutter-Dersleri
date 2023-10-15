import 'package:flutter/material.dart';

class Result {
  final bool success;
  final String message;
  final Status status;

  Result({required this.success, this.message = '', this.status = Status.none});
}

enum Status {
  none,
  // diğer durumlar buraya eklenebilir
}
