import '../../entities/refresh_token.dart';
import '../../entities/token.dart';

abstract class AuthSecureRepository {
  Future<void> setSecurityToken({
    required Token token,
    required RefreshToken refreshToken,
  });

  Future<Token> getToken();

  Future<RefreshToken> getRefreshToken();

  Future<void> deleteSecurityToken();

  Future<bool> has();
}
