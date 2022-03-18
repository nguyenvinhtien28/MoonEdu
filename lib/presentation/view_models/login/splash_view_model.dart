import 'package:auto_route/auto_route.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/secure_storage/secure_storage.dart';
import '../view_model.dart';

final splashViewModelProvider = ChangeNotifierProvider.autoDispose
    .family<SplashViewModel, StackRouter>((ref, router) {
  return SplashViewModel(ref.read, router);
});

class SplashViewModel extends ViewModel {
  SplashViewModel(this.read, this.router) : super(read);

  final Reader read;

  final StackRouter router;

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  Future<void> autoLogin() async {
    try {
      final token = await _storage.read('token');
      if (token != null) {
        router.replace(const HomeRoute());
      } else {
        router.replace(const LoginRoute());
      }
    } catch (e) {
      throw Exception("init splashProvider $e");
    }
  }
}
