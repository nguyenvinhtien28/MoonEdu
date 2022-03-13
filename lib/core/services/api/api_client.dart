part of api_service;

class ApiClient {
  static ApiClient? instance;

  factory ApiClient() => instance ??= ApiClient._();

  ApiClient._() {
    _dio = Dio();

    _dio.options = _baseOptions;
    _dio.httpClientAdapter = DefaultHttpClientAdapter();
    _dio.interceptors.add(_interceptorsWrapper);

    if (kDebugMode) {
      _dio.interceptors.add(_logInterceptor);
    }
  }

  late Dio _dio;

  static BaseOptions get _baseOptions {
    return BaseOptions(
      baseUrl: BasePathConfig.instance.basePath,
      contentType: 'application/json',
      connectTimeout: _kConnectTimeout.inMilliseconds,
      sendTimeout: _kSendTimeout.inMilliseconds,
      receiveTimeout: _kReceiveTimeout.inMilliseconds,
    );
  }

  static InterceptorsWrapper get _interceptorsWrapper {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(await userAgentClientHintsHeader());
        handler.next(options);
      },
    );
  }

  static LogInterceptor get _logInterceptor {
    return LogInterceptor(
      responseBody: false,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: false,
      requestBody: false,
    );
  }

  Future<Response?> invokeAPI(
    String path, {
    required ApiMethod apiMethod,
    Object? bodyData,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    try {
      switch (apiMethod) {
        case ApiMethod.get:
          return _get(
            path,
            queryParameters: queryParameters,
            options: options?..receiveTimeout,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.post:
          return _post(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.patch:
          return _patch(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

        case ApiMethod.delete:
          return _delete(
            path,
            data: bodyData,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
      }
    } on SocketException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on TlsException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on IOException catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    } on Exception catch (e, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: ${apiMethod.name.toUpperCase()} $path',
        e,
        trace,
      );
    }
  }

  Future<Response?> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options?..receiveTimeout,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      return null;
    }

    return response;
  }

  Future<Response?> _post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      return null;
    }

    return response;
  }

  Future<Response?> _patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      return null;
    }

    return response;
  }

  Future<Response?> _delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    if ((response.statusCode ?? _unknownStatusCode) >= HttpStatus.badRequest) {
      throw ApiException(
        response.statusCode ?? _unknownStatusCode,
        response.statusMessage,
      );
    }

    if (response.data == null && response.statusCode == HttpStatus.noContent) {
      return null;
    }

    return response;
  }
}
