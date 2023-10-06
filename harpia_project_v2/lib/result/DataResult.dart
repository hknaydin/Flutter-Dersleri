import 'Result.dart';

class DataResult<T> extends Result {
  final T data;

  DataResult(
      {required this.data,
      required bool success,
      String message = '',
      Status status = Status.none})
      : super(success: success, message: message, status: status);
}
