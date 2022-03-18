import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../data/models/AuthenticationUserModel.dart';
import '../../../domain/usecases/auth/login_use_case.dart';
import '../../route/router.dart';
import '../../route/router.gr.dart';
import '../view_model.dart';

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose.family<LoginViewModel, StackRouter>(
  (ref, router) => LoginViewModel(ref.read, router),
);

enum _LoginErrorStatus {
  failed, // Login failure
  connectionError, // off-line
}

class LoginViewModel extends ViewModel {
  LoginViewModel(this.read, this.router) : super(read);

  final Reader read;

  final StackRouter router;

  LoginUseCase get loginUseCase => read(loginUseCaseProvider);

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  // State management
  String username = "";
  String password = "";
  String notificationLogin = "";
  late AuthenticationUserModel user = const AuthenticationUserModel();

  // Error message
  String errorMessage = "";

  Future<void> login() async {
    try {
      if (!await isOnline()) {
        errorMessage = _getErrorMessage(_LoginErrorStatus.connectionError);
        notifyListeners();
        return;
      }

      final params = LoginParam(username: username, password: password);

      final auth = await loginUseCase.call(params: params);
      await _storage.write('token', '${auth.token}');
      debugPrint(auth.token);
      router.replace(const HomeRoute());
    } catch (e) {
      notificationLogin = "Sai tên đăng nhập hoặc mật khẩu";
      errorMessage = _getErrorMessage(_LoginErrorStatus.failed);
      notifyListeners();
      // If it is a response of forced version upgrade
      if (e is GenericException && e.code == ExceptionType.forcedUpdate) {
        handleExceptions(e);
        debugPrint('-------------------> ' + e.message);
      }
    }
  }

  ///
  /// Select an error message
  ///
  String _getErrorMessage(_LoginErrorStatus errorStatus) {
    switch (errorStatus) {
      case _LoginErrorStatus.connectionError:
        return "The network is not connected.";

      case _LoginErrorStatus.failed:
        return "One of the input items is incorrect. "
            "Please check the input details and enter again.";

      default:
        return "";
    }
  }
}
