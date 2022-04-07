import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/core/services/api/api.dart';
import 'package:flutter_sakura_base/data/models/AuthenticationChangeInfo.dart';
import 'package:flutter_sakura_base/data/sources/remote/api_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/secure_storage/secure_storage.dart';
import '../../../core/services/secure_storage/storage_parh.dart';
import '../../../data/models/AuthenticationUserModel.dart';
import '../../../domain/entities/authentication_change_info.dart';
import '../view_model.dart';

final userViewModelProvider =
    ChangeNotifierProvider.autoDispose<UserInfoViewModel>(
  (ref) => UserInfoViewModel(ref.read),
);

class UserInfoViewModel extends ViewModel {
  UserInfoViewModel(this.read) : super(read);

  final Reader read;
  late AuthenticationUserModel userModel = const AuthenticationUserModel();

  SecureStorageHelper get _storage => read(secureStorageHelperProvider);

  /// email
  String _email = '';

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  /// address
  String _address = '';

  String get address => _address;

  set address(String? address) {
    _address = address ?? '';
    notifyListeners();
  }

  /// address
  String _name = '';

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  /// address
  String _gender = '';

  String get gender => _gender;

  set gender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  /// address
  String _oldPassword = '';

  String get oldPassword => _oldPassword;

  set oldPassword(String oldPassword) {
    _oldPassword = oldPassword;
    notifyListeners();
  }

  /// address
  String _newPassword = '';

  String get newPassword => _newPassword;

  set newPassword(String newPassword) {
    _newPassword = newPassword;
    notifyListeners();
  }

  /// address
  String _birth = '';

  String get birth => _birth;

  set birth(String birth) {
    _birth = birth;
    notifyListeners();
  }

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
  Future<AuthenticationUserModel?>  userInfo() async {
    try {
      if(await isOnline()){
        print(isOnline.toString());
      }
      final response = await ApiClient().invokeAPI(
        '${ApiPath.api}/api/v1/user/info',
        apiMethod: ApiMethod.get,
      );
      debugPrint("data coming");
      debugPrint(response.toString());
      return AuthenticationUserModel.fromJson(response.data!['data']);
    }  catch (e) {
      handleExceptions(GenericException.handler(e));
      return null;
    }

    //   return AuthenticationUserModel.fromJson(response.data!['data']);
    // } else {
    //   debugPrint(response.data);
    //   debugPrint(response.headers.toString());
    //   throw Exception('Failed to load album');
    // }
  }

  Future<AuthenticationChangeInfo> updateEmail() async {
    final Dio dio = Dio();
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1//user/update',
        data: {'id': id, 'address': email});
    if (response.statusCode == 200) {
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AuthenticationChangeInfo> updateAddress() async {
    final Dio dio = Dio();
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1//user/update',
        data: {'id': id, 'address': address});
    if (response.statusCode == 200) {
      router.pop(address);
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AuthenticationChangeInfo> updateName() async {
    final Dio dio = Dio();
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1//user/update',
        data: {'id': id, 'name': name});
    if (response.statusCode == 200) {
      router.pop();
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AuthenticationChangeInfo> updateGender() async {
    final Dio dio = Dio();
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1//user/update',
        data: {'id': id, 'gender': gender});
    if (response.statusCode == 200) {
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AuthenticationChangeInfo> updateBirth() async {
    final Dio dio = Dio();
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1//user/update',
        data: {'id': id, 'birth': birth});
    if (response.statusCode == 200) {
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<AuthenticationChangeInfo> changePassword() async {
    final Dio dio = Dio();
    final token = await _storage.read(StoragePath.token);
    final id = await _storage.read(StoragePath.id);
    final Response response = await dio.post(
        '${ApiPath.api}/api/v1/user/change-password/?token=$token',
        data: {
          'id': id,
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        });
    if (response.statusCode == 200) {
      router.pop();
      return AuthenticationChangeInfoModel.fromJson(response.data!['data']);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
