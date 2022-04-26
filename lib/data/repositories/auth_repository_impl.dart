import 'package:flutter_sakura_base/domain/entities/refresh_token.dart';

import '../../core/exceptions/exceptions.dart';
import '../../domain/entities/authentication_request.dart';
import '../../domain/entities/authentication_user.dart';
import '../../domain/entities/token.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../sources/remote/auth_remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl([AuthRemote? authRemote])
      : _authRemote = authRemote ?? AuthRemote();

  final AuthRemote _authRemote;

  @override
  Future<AuthenticationUser> login(
    AuthenticationRequest authRequest,
  ) async {
    try {
      final authenticationUser = await _authRemote.login(authRequest);

      return authenticationUser;
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

  @override
  Future<AuthenticationUser> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
