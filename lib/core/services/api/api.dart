library api_service;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sakura_base/data/sources/remote/api_path.dart';

import '../secure_storage/secure_storage.dart';
import '../secure_storage/storage_parh.dart';

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
