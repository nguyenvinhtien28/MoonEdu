import 'package:flutter/cupertino.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/usecases/auth/registry_use_case.dart';
import '../view_model.dart';

final registerViewModelProvider = ChangeNotifierProvider.autoDispose
    <RegisterViewModel>((ref) {
  return RegisterViewModel(ref.read);
});
enum _RegisterErrorStatus {
  failed, // Login failure
  connectionError, // off-line
}

class RegisterViewModel extends ViewModel {
  RegisterViewModel(this.read) : super(read);

  final Reader read;

  RegistryUseCase get registerUseCase => read(registryUseCaseProvider);

  String username = "";
  String email = "";
  String password = "";
  String errorMessage = "";

  Future<void> register() async {
    try {
      if (!await isOnline()) {
        errorMessage = _getErrorMessage(_RegisterErrorStatus.connectionError);
        notifyListeners();
        return;
      }

      final params = RegistryParam(
        userName: username,
        email: email,
        password: password,
      );

      await registerUseCase.call(params: params);
      router.replace(const LoginRoute());
    } catch (e) {
      errorMessage = _getErrorMessage(_RegisterErrorStatus.failed);
      notifyListeners();
      if (e is GenericException && e.code == ExceptionType.forcedUpdate) {
        handleExceptions(e);
        debugPrint('-------------------> ' + e.message);
      }
    }
  }

  String _getErrorMessage(_RegisterErrorStatus errorStatus) {
    switch (errorStatus) {
      case _RegisterErrorStatus.connectionError:
        return "The network is not connected.";

      case _RegisterErrorStatus.failed:
        return "One of the input items is incorrect. "
            "Please check the input details and enter again.";

      default:
        return "";
    }
  }
}
