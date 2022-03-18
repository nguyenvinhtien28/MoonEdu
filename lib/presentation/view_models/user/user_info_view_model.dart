import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../data/models/AuthenticationUserModel.dart';
import '../view_model.dart';

final userViewModelProvider =
    ChangeNotifierProvider.autoDispose.family<UserInfoViewModel, StackRouter>(
  (ref, router) => UserInfoViewModel(ref.read, router),
);

class UserInfoViewModel extends ViewModel {
  UserInfoViewModel(this.read, this.router) : super(read);

  final Reader read;
  final StackRouter router;
  late AuthenticationUserModel userModel = const AuthenticationUserModel();

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  // Future init() async {
  //   try {
  //     userModel.name = await _getCompanyName();
  //     loginData.groupName = await _getGroupName();
  //     loginData.placeName = await _getPlaceName();
  //   } catch (e) {
  //     throw Exception("init appProvider $e");
  //   }
  // }
  //
  // Future<dynamic> userInfo() async {
  //   final token = _storage.read('token');
  //   try {
  //     final Dio dio = Dio();
  //     final Response response =
  //         await dio.get('http://192.168.0.109:3002/api/v1/user/info',
  //            options: Options(
  //           headers: {"token": '$token'},
  //         ));
  //     print("data coming");
  //     print(response);
  //   } on DioError catch (e) {
  //     print(e.response?.data);
  //     print(e.response?.headers);
  //   }
  // }
  Future<AuthenticationUserModel> userInfo() async {
    final token = await _storage.read('token');
    final Dio dio = Dio();
    //dio.interceptors.add({'token': token});
    final Response response = await dio.get(
      'http://192.168.0.107:3002/api/v1/user/info',
      options: Options(
        headers: {
          'token': token, // set content-length
        },
      ),
    );
    //print("data coming");
    //print(response);
    if (response.statusCode == 200) {
      return AuthenticationUserModel.fromJson(response.data!['data']);
    } else {
      print(response.data);
      print(response.headers);
      throw Exception('Failed to load album');
    }
  }
}
