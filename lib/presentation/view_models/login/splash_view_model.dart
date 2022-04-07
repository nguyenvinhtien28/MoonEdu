import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/secure_storage/secure_storage.dart';
import '../view_model.dart';

final splashViewModelProvider = ChangeNotifierProvider.autoDispose
<SplashViewModel>((ref) {
  return SplashViewModel(ref.read );
});

class SplashViewModel extends ViewModel {
  SplashViewModel(this.read) : super(read);

  final Reader read;

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
