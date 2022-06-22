import 'package:flutter_sakura_base/presentation/route/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../core/services/secure_storage/storage_parh.dart';
import '../view_model.dart';

final profileViewModelProvider = ChangeNotifierProvider.autoDispose
   <ProfileViewModel>((ref) {
  return ProfileViewModel(ref.read);
});

class ProfileViewModel extends ViewModel {
  ProfileViewModel(this.read) : super(read);

  final Reader read;

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  Future<void> logOut() async {
    try {
      await _storage.delete(StoragePath.token);
      router.replace(const LoginRoute());
    } catch (e) {
      throw Exception("init profileProvider $e");
    }
  }

  ///
  /// Select an error message
  ///

}
