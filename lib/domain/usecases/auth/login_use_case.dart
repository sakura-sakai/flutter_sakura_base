import 'package:flutter_sakura_base/core/exceptions/exceptions.dart';
import 'package:flutter_sakura_base/data/repositories/auth_repository_impl.dart';
import 'package:flutter_sakura_base/data/repositories/auth_secure_repository_impl.dart';

import '../../entities/authentication_request.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_secure_repository.dart';
import '../use_case.dart';

class LoginUseCase implements UseCase<void, LoginParam> {
  LoginUseCase([
    AuthRepository? auth,
    AuthSecureRepository? authSecure,
  ])  : _authRepository = auth ?? AuthRepositoryImpl(),
        _authSecureRepository = authSecure ?? AuthSecureRepositoryImpl();

  final AuthRepository _authRepository;
  final AuthSecureRepository _authSecureRepository;

  @override
  Future<void> call({required LoginParam params}) async {
    try {
      final authenticationUser = await _authRepository.login(
        AuthenticationRequest(params.email, params.password),
      );

      await _authSecureRepository.setSecurityToken(
        token: authenticationUser.token,
        refreshToken: authenticationUser.refreshToken,
      );
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}

class LoginParam {
  const LoginParam({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
