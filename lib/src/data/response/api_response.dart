



import 'package:movie_addict/src/data/response/api_status.dart';

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.standby() : status = ApiStatus.standby;

  ApiResponse.loading() : status = ApiStatus.loading;

  ApiResponse.completed(this.data) : status = ApiStatus.completed;

  ApiResponse.error(this.message) : status = ApiStatus.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}