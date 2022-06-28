import 'package:flutter/cupertino.dart';
import 'package:flutter_sakura_base/core/services/secure_storage/storage_parh.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/api/api.dart';
import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../data/models/AuthenticationUserModel.dart';
import '../../../data/sources/remote/api_path.dart';
import '../../../domain/usecases/auth/login_use_case.dart';
import '../../route/router.dart';
import '../view_model.dart';

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>(
  (ref) => LoginViewModel(ref.read),
);

enum _LoginErrorStatus {
  failed, // Login failure
  connectionError, // off-line
}

class LoginViewModel extends ViewModel {
  LoginViewModel(this.read) : super(read);

  final Reader read;

  LoginUseCase get loginUseCase => read(loginUseCaseProvider);

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  String username = "";
  String password = "";
  String notificationLogin = "";
  late AuthenticationUserModel user = const AuthenticationUserModel();

  String _errorMessage = "";

  set errorMessage(String er) {
    _errorMessage = er;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  Future<void> login() async {
    try {
      if (!await isOnline()) {
        errorMessage = _getErrorMessage(_LoginErrorStatus.connectionError);
        notifyListeners();
        return;
      }

      final params = LoginParam(username: username, password: password);

      final auth = await loginUseCase.call(params: params);
      await _storage.write(StoragePath.token, '${auth.token}');
      await _storage.write(StoragePath.id, '${auth.id}');

      final response = await ApiClient().invokeAPI(
        '${ApiPath.api}/api/v1/user/info',
        apiMethod: ApiMethod.get,
      );
      debugPrint("data coming");
      debugPrint(response.data!['data']['token']);
      await _storage.write(
        StoragePath.tokenUserList,
        response.data!['data']['token'],
      );

      debugPrint(auth.token);
      debugPrint(auth.id.toString());
      router.replace(const HomeRoute());
    } catch (e) {
      errorMessage = _getErrorMessage(_LoginErrorStatus.failed);
      notifyListeners();
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
        return "Không có kết nối mạng!";

      case _LoginErrorStatus.failed:
        return "Sai tên đăng nhập hoặc mật khẩu";

      default:
        return "";
    }
  }
}
