import '../../entities/authentication_request.dart';
import '../../entities/authentication_user.dart';
import '../../entities/refresh_token.dart';
import '../../entities/token.dart';

abstract class AuthRepository {
  Future<AuthenticationUser> signUp();

  Future<AuthenticationUser> login(
    AuthenticationRequest authRequest,
  );

  Future<void> logout(Token token);

  Future<AuthenticationUser> refreshToken(RefreshToken refreshToken);
}
