library api_service;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../config/api_config/base_path_config.dart';




export 'api_result.dart';

part 'api_client.dart';

part 'api_exception.dart';

const int _unknownStatusCode = -1;

/// Config api time-out
const Duration _kConnectTimeout = Duration(seconds: 30);
const Duration _kSendTimeout = Duration(seconds: 30);
const Duration _kReceiveTimeout = Duration(seconds: 30);

enum ApiMethod {
  get,
  post,
  patch,
  delete,
}
