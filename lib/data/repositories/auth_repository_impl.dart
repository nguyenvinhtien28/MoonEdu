import 'package:flutter_sakura_base/domain/entities/authentication_register.dart';
import 'package:flutter_sakura_base/domain/entities/refresh_token.dart';
import 'package:flutter_sakura_base/domain/entities/register_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../domain/entities/authentication_request.dart';
import '../../domain/entities/authentication_user.dart';
import '../../domain/entities/token.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../sources/remote/auth_remote.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authRemote = ref.read(authRemoteProvider);
  return AuthRepositoryImpl(authRemote);
});

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authRemote);

  final AuthRemote authRemote;

  @override
  Future<AuthenticationUser> login(
    AuthenticationRequest authRequest,
  ) async {
    try {
      return await authRemote.login(authRequest);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  @override
  Future<AuthenticationRegister> register(
    RegistryRequest request,
  ) async {
    try {
      return await authRemote.register(request);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }

  @override
  Future<void> logout(Token token) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthenticationUser> refreshToken(RefreshToken refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
