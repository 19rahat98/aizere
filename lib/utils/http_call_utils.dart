import 'dart:async';
import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/constants/global_network_constant.dart';
import 'package:aizere_app/common/core/error/error_data.dart';
import 'package:aizere_app/utils/exeption/exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

/// функция для получения резултата
typedef ResponseJson<T> = T Function(Map<String, dynamic>);

/// функция для получения пользователькой ошибка
/// [dynamic] ошибка в виде json
/// [String] ошибка по умалчанию
typedef ErrorResponsePrinter<T> = HttpRequestException<T> Function(Map<String, dynamic>, String, int);

/// вызов безопасно http функцию с обработкой пользовтелькой ошибки, а также обратный вызов для работы с
/// локальной базов в лучае какой либо ошибки
/// T отвер сервера
Future<T> safeApiCallWithDataBase<T>({
  Map<String, dynamic> Function()? onQueryDataBase,
  Future<Response>? networkCall,
  Function(Map<String, dynamic>)? onSaveDataBase,
  required ResponseJson<T> onResult,
}) async {
  try {
    final result = await networkCall;
    final json = await result?.data;
    onSaveDataBase?.call(json);
    return onResult.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final dataBaseValue = onQueryDataBase?.call();
      if (dataBaseValue?.isEmpty ?? false) {
        return onResult.call(dataBaseValue!);
      }
      final data = ex.response?.data;
      final message = _handleDioErrorType(ex, data);
      throw HttpRequestException<String>(
        message: message,
        code: ex.response?.statusCode ?? GlobalConstant.negative,
        httpTypeError: HttpTypeError.http,
      );
    }
    throw _throwDefaultError(ex);
  }
}

/// вызов безопасно http функцию с обработкой пользовтелькой ошибки
/// [T] отвер сервера
Future<T> safeApiCall<T>(
  Future<Response> response,
  ResponseJson<T> jsonCall, {
  bool? isTest,
}) async {
  await _makeThrowInternetConnection(isTest ?? false);
  try {
    final result = await response;
    final json = result.data;
    return jsonCall.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      final message = _handleDioErrorType(ex, data);
      throw HttpRequestException<String>(
        message: message,
        code: ex.response?.statusCode ?? GlobalConstant.negative,
        httpTypeError: HttpTypeError.http,
      );
    }
    throw _throwDefaultError(ex);
  }
}

/// вызов безопасно http функцию возвращает void (вызывать в случае пустого ответа)
/// [response] - ответ от сервера
Future<void> safeApiCallVoid(
  Future<Response> response, {
  bool? isTest,
}) async {
  await _makeThrowInternetConnection(isTest ?? false);
  try {
    await response;
    return;
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      final message = _handleDioErrorType(ex, data);
      throw HttpRequestException<String>(
        message: message,
        code: ex.response?.statusCode ?? GlobalConstant.negative,
        httpTypeError: HttpTypeError.http,
      );
    }
    throw _throwDefaultError(ex);
  }
}

/// вызов безопасно http функцию
/// T отвер сервера
/// V ответ сервера в виде ошибки
Future<T> safeApiCallWithError<T, V>(
  Future<Response> response,
  ResponseJson<T> jsonCall,
  ErrorResponsePrinter<V> errorResponsePrinter, {
  bool? isTest,
}) async {
  await _makeThrowInternetConnection(isTest ?? false);
  try {
    final result = await response;
    final json = result.data;
    return jsonCall.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      throw errorResponsePrinter.call(
        data,
        _handleDioErrorType(ex),
        ex.response?.statusCode ?? GlobalConstant.negative,
      );
    }

    throw _throwDefaultError(ex);
  }
}

/// вызов безопасно http функцию
/// T отвер сервера
/// V ответ сервера в виде ошибки
Future<void> safeApiVoidCallWithError<V>(
    Future<Response> response,
    ErrorResponsePrinter<V> errorResponsePrinter, {
      bool? isTest,
    }) async {
  await _makeThrowInternetConnection(isTest ?? false);
  try {
    await response;
    return;
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      throw errorResponsePrinter.call(
        data,
        _handleDioErrorType(ex),
        ex.response?.statusCode ?? GlobalConstant.negative,
      );
    }

    throw _throwDefaultError(ex);
  }
}

/// выкидывает исключение в виде ошибки по умалчанию
HttpRequestException<String> _throwDefaultError(exception) {
  return HttpRequestException<String>(
    message: exception,
    code: GlobalConstant.zeroInt,
    httpTypeError: HttpTypeError.http,
  );
}

/// вызывает исключение при отсутсии интернета
Future<HttpRequestException<String>?> _makeThrowInternetConnection(
  bool isTest,
) async {
  if (isTest == false) {
    final isInternetConnection = await _checkInternetConnection();
    if (!isInternetConnection) {
      throw HttpRequestException<String>(
        message: "Нет интернет соеденения",
        code: GlobalConstant.negative,
        httpTypeError: HttpTypeError.notInternetConnection,
      );
    }
  }
  return null;
}

/// проверка интернет соеденения
Future<bool> _checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

/// обработчик ошибок по типу ошибко [Dio]
/// [DioErrorType] ошибка
String _handleDioErrorType(DioError ex, [Map<String, dynamic>? data]) {
  switch (ex.type) {
    //case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      {
        return "Время таймаута истекло";
      }
    default:
      {
        // if (ex.message.contains(GlobalNetworkConstant.socketException)) {
        //   return "Ошибка соеденения";
        // }
        return data != null ? ErrorData.fromJson(data).message : "Ошибка сервера";
      }
  }
}


Future<T> safeApiCallListData<T>(
  Future<Response> response,
  T Function(List<dynamic>) jsonCall, {
  bool? isTest,
}) async {
  try {
    final result = await response;
    final json = result.data;
    return jsonCall.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      final message = _handleDioErrorType(ex, data);
      throw HttpRequestException<String>(
        message: message,
        code: ex.response?.statusCode ?? GlobalConstant.negative,
        httpTypeError: HttpTypeError.http,
      );
    }
    throw _throwDefaultError(ex);
  }
}