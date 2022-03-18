import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../data/repositories/auth_repository_impl.dart';
import '../../entities/authentication_register.dart';
import '../../entities/register_request.dart';
import '../../repositories/auth/auth_repository.dart';
import '../use_case.dart';

final registryUseCaseProvider = Provider<RegistryUseCase>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return RegistryUseCase(authRepository);
  },
);

class RegistryUseCase
    implements UseCase<AuthenticationRegister, RegistryParam> {
  RegistryUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<AuthenticationRegister> call({
    required RegistryParam params,
  }) async {
    return await authRepository.register(
        RegistryRequest(
       params.userName,
     params.email,
      params.password,
    ));
  }
}
class RegistryParam extends Equatable {
  const RegistryParam({
    required this.userName,
    required this.email,
    required this.password,
  });

  final String userName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [userName, email, password];
}
