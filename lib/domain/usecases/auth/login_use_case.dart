import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../data/repositories/auth_repository_impl.dart';
import '../../entities/authentication_request.dart';
import '../../entities/authentication_user.dart';
import '../../repositories/auth/auth_repository.dart';
import '../use_case.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return LoginUseCase(authRepository);
});

class LoginUseCase
    implements UseCase<AuthenticationUser, LoginParam> {
  LoginUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<AuthenticationUser> call({
    required LoginParam params,
  }) async {
    return await authRepository.login(
      AuthenticationRequest(params.username, params.password),
    );
  }
}

class LoginParam extends Equatable {
  const LoginParam({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}
