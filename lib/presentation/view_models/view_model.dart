import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/services/other/network.dart';


class ViewModel extends ChangeNotifier with Network {
  ViewModel(Reader read) : _read = read;

  final Reader _read;

  ExceptionHandler get _exception => _read(exceptionHandlerProvider);

  StackRouter get router => _read(routerProvider);

  void handleExceptions(dynamic e) => _exception.handler(e);
}
