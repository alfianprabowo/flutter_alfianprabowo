import 'package:teramedik/app/utils/constants/text_const.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/utils/enums/api_status.dart';

import 'index.dart';

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;
  ApiError? apiError;

  ApiResponse({
    this.status,
    this.data,
    this.apiError,
  });

  ApiResponse.withoutData({
    this.status,
    this.apiError,
  });

  static ApiResponse<T> loading<T>() {
    return ApiResponse<T>(status: ApiStatus.loading);
  }

  static ApiResponse success<T>(T data) {
    return ApiResponse<T>(
      status: ApiStatus.completed,
      data: data,
    );
  }

  static ApiResponse error<T>({
    int? errCode,
    String? errMsg,
    T? errBdy,
    T? data,
  }) {
    var apiError = ApiError(
      statusCode: errCode!,
      errorMessage: errMsg!,
      errorBody: errBdy,
    );
    return ApiResponse.withoutData(
      status: ApiStatus.error,
      apiError: apiError,
    );
  }

  static ApiResponse<dynamic> returnResponse<T>(
    Response response,
    T apiResponse,
  ) {
    if (response.statusCode == ApiResponseCode.success_200 ||
        response.statusCode == ApiResponseCode.success_201) {
      return ApiResponse.success(apiResponse);
    } else if (response.statusCode == ApiResponseCode.internetUnavailable) {
      return ApiResponse.error(
        errCode: response.statusCode,
        errMsg: TextConst.noInternet,
      );
    } else if ((response.statusCode! >= ApiResponseCode.error_400 &&
            response.statusCode! <= ApiResponseCode.error_499) ||
        response.statusCode == ApiResponseCode.error_501) {
      return ApiResponse.error(
        errCode: response.statusCode,
        errMsg: response.statusText,
        errBdy: apiResponse,
        data: apiResponse,
      );
    } else {
      return ApiResponse.error(
        errCode: ApiResponseCode.error_500,
        errMsg: TextConst.somethingWrong,
        errBdy: TextConst.tryAgain,
        data: null,
      );
    }
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
