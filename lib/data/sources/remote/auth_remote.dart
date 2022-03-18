import 'package:flutter_sakura_base/data/models/AuthenticationRegisterModel.dart';
import 'package:flutter_sakura_base/data/sources/remote/api_path.dart';
import 'package:flutter_sakura_base/domain/entities/authentication_request.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/services/api/api.dart';
import '../../../domain/entities/register_request.dart';
import '../../models/AuthenticationUserModel.dart';

final authRemoteProvider = Provider<AuthRemote>((ref) => AuthRemote());

class AuthRemote {
  final ApiClient _client = ApiClient();
  final storage = const FlutterSecureStorage();
  Future<AuthenticationUserModel> login(AuthenticationRequest request) async {

    final data = {
      "userName": request.username,
      "password": request.password,
    };
    final response = await _client.invokeAPI(
      ApiPath.login,
      apiMethod: ApiMethod.post,
      bodyData: data,
    );
    return AuthenticationUserModel.fromJson(response.data!['data']);
  }

  Future<AuthenticationRegisterModel> register(RegistryRequest request) async {
    final postData = {
      'userName': request.userName,
      'email': request.email,
      'password': request.password,
    };

    final response = await _client.invokeAPI(
      ApiPath.register,
      apiMethod: ApiMethod.post,
      bodyData: postData,
    );
    return AuthenticationRegisterModel.fromJson(response.data!['data']);
  }
}
