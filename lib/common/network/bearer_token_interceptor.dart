import 'package:aizere_app/common/constants/global_network_constant.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/pref/auth_data_source.dart';
import 'package:aizere_app/feature/auth/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';

/// interceptor для отправки авторизационного хэдера
/// и обработки ошибок [401] и [403]
class BearerTokenInterceptor extends InterceptorsWrapper {
  BearerTokenInterceptor(this.dio)
      : _authDataSource = sl(),
        _authRepository = sl();

  final Dio dio;
  final AuthDataSource _authDataSource;
  final AuthRepository _authRepository;

  /// максимальное количесво повтори при авторизационных ошибках
  static const maxRepeatCount = 3;

  /// счетчик для повторов запроса в случае авторизационных ошибок [401] и [403]
  int _repeatCounter = 0;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _authDataSource.token;
    options.headers[GlobalNetworkConstant.authorization] =
        '${GlobalNetworkConstant.bearer} $accessToken';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _resetRepeatCounter();
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      final requestOptions = err.response?.requestOptions;

      try {
        final authResponse = await _authRepository.refreshToken();
        _authDataSource.saveToken(authResponse);
        requestOptions?.headers[GlobalNetworkConstant.authorization] =
            '${GlobalNetworkConstant.bearer} $authResponse';

        /// обновляем счетчик если количество повторов превисило лимит
        if (_repeatCounter >= maxRepeatCount) {
          _resetRepeatCounter();
          return handler.reject(err);
        }

        _repeatCounter++;

        // TODO need check for null safety
        final response = await dio.fetch<dynamic>(requestOptions!);
        return handler.resolve(response);
      } catch (ex) {
        _resetRepeatCounter();
        return handler.reject(err);
      }
    } else {
      _resetRepeatCounter();
      return handler.reject(err);
    }
  }

  /// обновляет счетчик _repeatCounter
  /// необходимо обновление в случае успешного ответа от сервера
  /// или при ошибках кроме 401 и 403
  void _resetRepeatCounter() {
    _repeatCounter = 0;
  }
}
